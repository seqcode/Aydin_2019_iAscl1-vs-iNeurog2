#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=65gb

module load r/3.4
module load python/2.7.8

cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/multigps_calls/Ebf2_26012018/


java -Xmx60G -jar ../multigps.mahonylab.jar  --species "Mus musculus;mm10" --threads 4 --exclude ~/group/genomes/mm10/annotation/mm10-blacklist_ENCODE.regions --design design.tab --verbose --poissongausspb --q 0.01 --probshared 0.99 --memepath ~/group/software/bin/ --mememinw 6 --mememaxw 18 --seq ~/group/genomes/mm10/ --out Ebf2_26012018_multigps  > 26012018.out 2>&1

for i in Ebf2_26012018_multigps/*48hr.events; do grep -v "#" $i | head -n 10000 >${i/.events/_top10k.events}; done
