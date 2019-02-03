#This run finds motifs in N vs A sites 

cd ~/group/projects/es/iAscl1_iNgn2/motifs/meme

cp ../../diffTFs/iAscl1-12h_vs_iNgn2-12h_top10K_01302018/*peaks .
for i in *peaks; do perl ../../utils/peaks2bed.pl $i 50 >${i/peaks/win50.bed}; done
for i in *inTop10k.win50.bed; do bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed $i >${i/bed/fa}; done

for i in *inTop10k.win50.fa; do ~/group/software/meme_4.11.3/bin/meme-chip -oc ${i/.win50.fa/_meme}  -meme-mod zoops -meme-minw 6 -meme-maxw 20  $i; done
