#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=40:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77-himem_collab
#PBS -l mem=60gb

module load R
module load java/jdk/1.8.0_25
module load python/2.7.9

cd /storage/home/auk262/group/projects/es/iAscl1_iNgn2/multigps_calls/Olig2_Ngn2_11152016

java -Xmx50G org.seqcode.projects.multigps.MultiGPS --species "Mus musculus;mm10" --threads 4 --exclude ~/group/genomes/mm10/annotation/mm10-blacklist_ENCODE.regions --design design.tab --verbose --poissongausspb --q 0.01 --probshared 0.99 --memepath /storage/group/sam77_collab/software/meme_4.9.0/bin/ --mememinw 6 --mememaxw 18 --seq /storage/group/sam77_collab/genomes/mm10 --out Olig2_Ngn2_11152016  > 11152016.out 2>&1

