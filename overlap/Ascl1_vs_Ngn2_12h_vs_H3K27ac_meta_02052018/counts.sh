#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load r/3.4
module load python/2.7.8

cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Ascl1_vs_Ngn2_12h_vs_H3K27ac_meta_02052018

for I in *domains; do java -Xmx30g -cp ../../utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.SequencingExptRegionsCounter --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --win 300 --peaks $I --counts --design design.tab > ${I/.domains/.counts}; done
