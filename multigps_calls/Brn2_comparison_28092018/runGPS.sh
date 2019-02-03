#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_hc_default
#PBS -l mem=65gb


cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/multigps_calls/Brn2_comparison_28092018

java -Xmx60G -jar ../multigps.mahonylab.jar  --species "Mus musculus;mm10" --threads 4 --exclude ~/group/genomes/mm10/annotation/mm10-blacklist_ENCODE.regions --design design.tab --verbose --poissongausspb --q 0.01 --probshared 0.99 --memepath ~/group/software/bin/ --mememinw 6 --mememaxw 18 --seq ~/group/genomes/mm10/ --out Brn2_comparison_28092018_multigps  > 28092018.out 2>&1
