#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=4:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=80gb

module load r/3.3
module load python/2.7.8

cd /storage/home/auk262/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains

## Provide cell 

java -Xmx60G org.seqcode.projects.seed.PeakFinder --threads 4 --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --design ascl1.design --peakfinding max --binwidth 50 --binstep 25 --poisslogpthres -5 --binpthres 0.05 --out ascl1_peaksAtdomains > ascl1_pf.log 2>&1
#java -Xmx60G org.seqcode.projects.seed.PeakFinder --threads 4 --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --design ngn2_and_chimera.design --peakfinding max --binwidth 50 --binstep 25 --poisslogpthres -5 --binpthres 0.05 --out ngn2_and_chimera_peaksAtdomains ngn2_and_chimera_pf.log 2>&1
