#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=22gb

cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-h3k27ac

cat ../../H3K27ac_domains_v3/domains/domains_K27ac_EB.p0.05.bed   ../../H3K27ac_domains_v3/domains/domains_K27ac_iA_48hr.p0.05.bed  ../../H3K27ac_domains_v3/domains/domains_K27ac_iN_48hr.p0.05.bed |grep -v chrM | grep -v chrUn >tmp.bed

bedtools sort -i tmp.bed >sort.bed
bedtools merge -d 100 -i sort.bed >eb_ia48h_in48h.merge.bed
rm tmp.bed sort.bed

perl ~/Tools/bed2regions.pl eb_ia48h_in48h.merge.bed >eb_ia48h_in48h.merge.reg

java -Xmx20G org.seqcode.deepseq.utils.RegionTagCounts --species "Mus musculus;mm10" --reg eb_ia48h_in48h.merge.reg --design 48h.design --out eb_ia48h_in48h.merge


