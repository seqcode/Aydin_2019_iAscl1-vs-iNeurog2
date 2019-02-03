#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_hc_default
#PBS -l mem=32gb

module load r/3.4
module load python/2.7.8

sequnwinderjar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/sequnwinder.public.jar"

cd $curr_dir 

java -Xmx30G -cp $sequnwinderjar org.seqcode.projects.sequnwinder.SeqUnwinder --geninfo $geninfo --seq $seq --threads 8 --memepath $memepath --win 200 --mink 4 --maxk 6 --r 10 --x 3 --a 400 --hillsthresh 0.5 --memenmotifs 3 --memesearchwin 16 --genregs $peaks --out sequnwinder_"$fac" > out.log 2>&1
