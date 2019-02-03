#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=300:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb


cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-atac-12-48-top100Ks
mkdir meme
cd meme

for i in ../atac*.bed; do j=$(basename $i); bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed $i >${j/bed/fa}; done

for i in atac*.fa; do ~/group/software/meme_4.11.3/bin/meme-chip -meme-p 4 -oc ${i/.fa/_meme}  -meme-nmotifs 5 -meme-mod zoops -meme-minw 6 -meme-maxw 20  $i; done
