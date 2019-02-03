#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=10
#PBS -j oe
#PBS -A sam77_a_g_sc_default
#PBS -l mem=40gb

module load r/3.3
module load python/2.7.8


cd /storage/home/auk262/group/projects/es/iAscl1_iNgn2/misc_analysis/sequnwinder_analysis/sequnwinder_05132017
java -Xmx30G org.seqcode.projects.sequnwinder.SeqUnwinder --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --threads 10 --memepath ~/work/bin/meme/bin/ --debug --makerandregs --win 150 --mink 4 --mink 5 --r 50 --x 3 --a 400 --hillsthresh 0.1 --memesearchwin 16 --genregs N_vs_A.peaks --out sequnwinder_out_r50 > out.log 2>&1
