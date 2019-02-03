#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

cd ~/group/projects/es/iAscl1_iNgn2/motifs/meme

#for i in ../motif-scanning/sites/*peaks; do j=$(basename $i); perl ../../utils/peaks2bed.pl $i 150 >${j/peaks/win150.bed}; done
#for i in *win150.bed; do bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed $i >${i/bed/fa}; done

for i in *win150.fa; do ~/group/software/meme_4.11.3/bin/meme-chip -oc ${i/.win150.fa/_meme}  -meme-nmotifs 5 -meme-mod zoops -meme-minw 6 -meme-maxw 20  $i; done
