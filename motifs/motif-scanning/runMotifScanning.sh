#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb


cd ~/group/projects/es/iAscl1_iNgn2/motifs/motif-scanning

cp ../meme/cognate.motifs .
cat ../kmer-counts/cagctg.motif >>cognate.motifs 
cat ../kmer-counts/caggtg.motif >>cognate.motifs 
cat ../kmer-counts/cagatg.motif >>cognate.motifs 
cat ../kmer-counts/catatg.motif >>cognate.motifs 
cat ../kmer-counts/cagstg.motif >>cognate.motifs 
cat ../kmer-counts/cakatg.motif >>cognate.motifs 

java org.seqcode.motifs.MarkovMotifThresholdFinder --species "Mus musculus" --genome mm10 --motiffile cognate.motifs --back  ~/group/data/general/backgroundmodels/mm8.back  --win 100 --num 1000000 >all.mthres
##Score for 0.01 and 0.05 FDRs for CAKATG motif in all.mthres was set to 10.079 so that it matches both CAGATG and CATATG. 

##Random locations/sequences
perl ~/Tools/randomRegions.pl ~/group/genomes/mm10/mm10.info 10000 150 >random.10K.150bp.reg
perl ~/Tools/regions2bed.pl random.10K.150bp.reg >bed/random.10K.150bp.bed
bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed bed/random.10K.150bp.bed -fo seqs/random.10K.150bp.seq

#Process each of the test peaks files, generating motif frequency stats
while read i j; do 
    echo $i; 
    jb=$(basename $j);
    perl ~/Tools/regions2bed.pl $j 150 >bed/$jb".bed";
    bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed bed/$jb".bed" -fo seqs/$jb".seq";
    java org.seqcode.motifs.MotifAnalysisMultiMotif --species "Mus musculus;mm10" --back ~/group/data/general/backgroundmodels/mm8.back --win 150 --hitstats --motiffile cognate.motifs  --motifthres all.mthres --multithres --peaks $j --peakseq seqs/$jb".seq" --neg random.10K.150bp.reg --negseq seqs/random.10K.150bp.seq >cognate-motifs_at_$i.txt;
done <testpeaks.list 

#Reformatting shortcut (FDR 0.01)
mkdir tmp
cd tmp
cut -f1 ../cognate-motifs_at_A-gt-N-12hr-top10k.txt |head -n56 |tail -n18 >aaaaa
for i in ../cognate-motifs_at_*; do j=${i/..\/cognate-motifs_at_/}; k=${j/.txt/}; echo "$k" >$k; cut -f6 $i |head -n56 |tail -n17 >>$k; done
paste * > ../cognate-motifs_summary_0.01.txt
cd ..
rm -R tmp
#Reformatting shortcut (FDR 0.05)
mkdir tmp
cd tmp
cut -f1 ../cognate-motifs_at_A-gt-N-12hr-top10k.txt |head -n37 |tail -n18 >aaaaa
for i in ../cognate-motifs_at_*; do j=${i/..\/cognate-motifs_at_/}; k=${j/.txt/}; echo "$k" >$k; cut -f6 $i |head -n37 |tail -n18 >>$k; done
paste * > ../cognate-motifs_summary_0.05.txt
cd ..
rm -R tmp
mkdir stats
mv cognate-motifs_at_*txt stats/


