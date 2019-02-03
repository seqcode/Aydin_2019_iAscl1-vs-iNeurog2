#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

cd ~/group/projects/es/iAscl1_iNgn2/motifs/meme

for i in  ../../multigps_calls/Brn2_14112017/Brn2_14112017_multigps/*48hr.events; do j=$(basename $i); perl ../../utils/peaks2bed.pl $i 50 |head -n 500 >${j/events/top500.win50.bed}; done
for i in ../../multigps_calls/Ebf2_26012018/Ebf2_26012018_multigps/*48hr.events; do j=$(basename $i); perl ../../utils/peaks2bed.pl $i 50 |head -n 500 >${j/events/top500.win50.bed}; done
for i in ../../multigps_calls/Onecut2_26012018/Onecut2_26012018_multigps/*48hr.events; do j=$(basename $i); perl ../../utils/peaks2bed.pl $i 50 |head -n 500 >${j/events/top500.win50.bed}; done
head -n500 Ascl1-12hr_gt_Ngn2-12hr_inTop10k.win50.bed > Ascl1-12hr_gt_Ngn2-12hr_inTop10k.top500.win50.bed
head -n500 Ngn2-12hr_gt_Ascl1-12hr_inTop10k.win50.bed > Ngn2-12hr_gt_Ascl1-12hr_inTop10k.top500.win50.bed
head -n500 Ngn2-12hr_shared_Ascl1-12hr_inTop10k.win50.bed > Ngn2-12hr_shared_Ascl1-12hr_inTop10k.top500.win50.bed

for i in *top500.win50.bed; do bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed $i >${i/bed/fa}; done

for i in *top500.win50.fa; do ~/group/software/meme_4.11.3/bin/meme -dna -revcomp -nmotifs 1 -oc ${i/.win50.fa/_meme}  -mod zoops -minw 6 -maxw 20  $i; done

for i in *top500_meme; do j=${i/.top500_meme}; perl ../../utils/formatMotifs.pl $i/meme.txt top500.motifs; sed -i "s/Motif1/$j/g" top500.motifs; done

