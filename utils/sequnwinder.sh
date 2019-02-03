#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=8
#PBS -j oe
#PBS -A sam77-himem_collab
#PBS -l mem=32gb

module load R
module load java/jdk/1.8.0_25
module load python/2.7.9

sequnwinderjar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/sequnwinder.public.jar"

cd $curr_dir 

java -Xmx30G -cp $sequnwinderjar org.seqcode.projects.sequnwinder.SeqUnwinder --geninfo $geninfo --seq $seq --threads 8 --memepath $memepath --win 200 --mink 4 --mink 5 --r 10 --x 3 --a 400 --hillsthresh 0.3 --memesearchwin 16 --genregs $peaks --out sequnwinder_"$fac" > out.log 2>&1
