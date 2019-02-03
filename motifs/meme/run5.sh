#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=100:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

#This run looks at differential ATAC-seq domains 

cd ~/group/projects/es/iAscl1_iNgn2/motifs/meme

cp ../../domain_calls/diff-domains/diff-atac/atac.i*bed .

for i in atac*.bed; do bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed $i >${i/bed/fa}; done

for i in atac*.fa; do ~/group/software/meme_4.11.3/bin/meme-chip -oc ${i/.fa/_meme}  -meme-nmotifs 5 -meme-mod zoops -meme-minw 6 -meme-maxw 20  $i; done
