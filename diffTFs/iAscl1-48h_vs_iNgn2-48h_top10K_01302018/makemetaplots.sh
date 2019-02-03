#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

module load r/3.4
module load python/2.7.8


cd ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-48h_vs_iNgn2-48h_top10K_01302018


cat Ascl1-48hr_gt_Ngn2-48hr_inTop10k.peaks Ngn2-48hr_shared_Ascl1-48hr_inTop10k.peaks Ngn2-48hr_gt_Ascl1-48hr_inTop10k.peaks > Ngn2_Ascl1.ordered


for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 73 --linethick 1 --readext 100 --color blue --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) Ascl1.ABCAM Ainv15(iAscl1.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_Ascl1-48hr-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 137 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_Ngn2-48hr-ChIP}; done


rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done
