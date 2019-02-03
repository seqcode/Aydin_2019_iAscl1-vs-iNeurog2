#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=400:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=210gb

cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains


java -Xmx200G org.seqcode.projects.seed.DomainFinder --threads 4 --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --design wernig_iAfibro.design --peakfinding max --binwidth 50 --binstep 25 --poisslogpthres -5 --binpthres 0.05 --out wernig_iAfibro_full_domains > wernig_iAfibro_full.log 2>&1

cd wernig_iAfibro_full_domains
for i in *p0.05.domains; do perl ../../../utils/regions2bed.pl $i >${i/.domains/.bed}; done


