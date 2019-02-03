#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

cd ~/group/projects/es/iAscl1_iNgn2/diffTFs/iNgn2-48h_vs_iNgn2-12h_top10K_10092018

seqcodejar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/seqcode.mahonylab.jar"

#Heatmaps
for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 70 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_Ngn2-12hr-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 95 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_Ngn2-48hr-ChIP}; done

rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done

