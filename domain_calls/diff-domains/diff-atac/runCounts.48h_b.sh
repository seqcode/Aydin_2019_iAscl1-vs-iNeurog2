#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=22gb

cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-atac

cat ../../ATACseq_domains/ascl1_domains/ascl1_domains_ia48h.p0.05.bed ../../ATACseq_domains/wernig_iAfibro_full_domains/wernig_iAfibro_full_domains_mef+48h.p0.05.bed |grep -v chrM | grep -v chrUn >tmp3.bed

bedtools sort -i tmp3.bed >sort3.bed
bedtools merge -d 100 -i sort3.bed >eb-ia48h_mef-ia48h.merge.bed
rm tmp3.bed sort3.bed

perl ~/Tools/bed2regions.pl eb-ia48h_mef-ia48h.merge.bed >eb-ia48h_mef-ia48h.merge.reg

java -Xmx20G org.seqcode.deepseq.utils.RegionTagCounts --species "Mus musculus;mm10" --reg eb-ia48h_mef-ia48h.merge.reg --design 48h_b.design --out  eb-ia48h_mef-ia48h.merge
