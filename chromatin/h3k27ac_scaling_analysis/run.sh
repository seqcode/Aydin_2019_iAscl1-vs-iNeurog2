#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=60gb

module load r/3.3
module load python/2.7.8

cd ~/group/projects/es/iAscl1_iNgn2/chromatin/h3k27ac_scaling_analysis

# get all domains with a q-value cut-off of 0.01
# eb domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/H3K27ac_domains_v3/peaksAtDomains/peaksAtDomains_K27ac_EB.p0.05.domains | head -100000 > 0h_domains.list
# iascl1 48h domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/H3K27ac_domains_v3/peaksAtDomains/peaksAtDomains_K27ac_iA_48hr.p0.05.domains > ia48h_domains.list
# ingn2 48h domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/H3K27ac_domains_v3/peaksAtDomains/peaksAtDomains_K27ac_iN_48hr.p0.05.domains | head -100000 > in48h_domains.list

#Blacklist filter
for i in *list; do java -cp ../../utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.FilterFeatures --species "Mus musculus;mm10" --seq ~/group/genomes/mm10 --peaks $i  --exclude ~/group/genomes/mm10/annotation/mm10-blacklist_ENCODE.regions > tmp; mv tmp $i; done

## get a union list of "unique" peaks
# uniqueness here is achieved by making sure that no two domain peak-summits are less than 100bp apart. In case, they fall within 100bp (--rad option) one domain is picked at random.
cat 0h_domains.list in48h_domains.list ia48h_domains.list | grep -v "seqcode" > tmp
java org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --uniq --peaksA tmp --rad 100 > h3k27ac_domains_unique.peaks
rm tmp


#Generate counts 
for I in h3k27ac_domains_unique.peaks; do java -Xmx30g -cp ../../utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.SequencingExptRegionsCounter --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --win 300 --peaks $I --counts --design design.tab > ${I/.peaks/.counts}; done

sed '1s/:/_/g' h3k27ac_domains_unique.counts | sed '1s/#//' > t
mv t h3k27ac_domains_unique.counts

## run tmm script to calculate scaling factors
Rscript calculate_tmm.R h3k27ac_domains_unique.counts > scaling_factors.txt
sed 's/\s\s*/\t/g' scaling_factors.txt | awk '{print $0"\t"$3*$4/1000000}' | sed '1s/0/lib_size_per_million/' > t
mv t scaling_factors.txt
