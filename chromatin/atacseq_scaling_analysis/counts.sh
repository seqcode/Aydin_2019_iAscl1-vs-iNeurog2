#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load r/3.3
module load python/2.7.8

cd /storage/home/auk262/group/projects/es/iAscl1_iNgn2/misc_analysis/atacseq_diff_analysis

for I in *peaks; do java -Xmx30g org.seqcode.lab.akshay.utils.SequencingExptRegionsCounter --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --win 300 --peaks $I --counts --design design.tab > ${I/.peaks/.counts}; done
