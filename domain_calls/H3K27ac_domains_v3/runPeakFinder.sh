#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load r/3.3
module load python/2.7.8


cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/H3K27ac_domains_v3

java -Xmx30G org.seqcode.projects.seed.DomainFinder --threads 4 --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --design design.tab --binwidth 50 --binstep 25 --mergewin 200 --poisslogpthres -5 --binpthres 0.05 --out domains > out.log 2>&1

java -Xmx30G org.seqcode.projects.seed.DomainFinder --threads 4 --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --design design.tab --binwidth 50 --binstep 25 --mergewin 200 --poisslogpthres -5 --binpthres 0.05 --peakfinding max --out peaksAtDomains > out_pf.log 2>&1


