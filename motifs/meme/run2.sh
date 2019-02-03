#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

#This run aims to find motifs in previously inactive N>A or A>N sites that gain accessibility in the "wrong" condition. 

cd ~/group/projects/es/iAscl1_iNgn2/motifs/meme


cd ~/group/projects/es/iAscl1_iNgn2/motifs/meme
cp ../../overlap/Ascl1_vs_Ngn2_12h_vs_acc_10132018/*48h-acc.win100.bed .
for i in *48h-acc.win100.bed; do bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed $i >${i/bed/fa}; done
for i in *48h-acc.win100.fa; do ~/group/software/meme_4.11.3/bin/meme-chip -oc ${i/.win100.fa/_meme}  -meme-mod zoops -meme-minw 6 -meme-maxw 20  $i; done
for i in *48h-acc_meme; do perl ../../utils/formatMotifs.pl $i/combined.meme $i/combined.motifs; done

