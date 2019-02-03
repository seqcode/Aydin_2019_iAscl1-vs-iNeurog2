#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load r/3.4
module load python/2.7.8

cd ~/group/projects/es/iAscl1_iNgn2/chromatin/activity_classes/Onecut2-iA_Onecut2-iN_EB-activity-classes

seqcodejar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/seqcode.mahonylab.jar"

cat Onecut2_ia_gt_in_Active_probGtePt8.peaks >Oc2_iN_vs_iA.ordered
cat Onecut2_ia_gt_in_Inactive_probGtePt8.peaks >>Oc2_iN_vs_iA.ordered
cat Onecut2_ia_in_shared_Active_probGtePt8.peaks >>Oc2_iN_vs_iA.ordered
cat Onecut2_ia_in_shared_Inactive_probGtePt8.peaks >>Oc2_iN_vs_iA.ordered
cat Onecut2_in_gt_ia_Active_probGtePt8.peaks >>Oc2_iN_vs_iA.ordered
cat Onecut2_in_gt_ia_Inactive_probGtePt8.peaks >>Oc2_iN_vs_iA.ordered

##### Ngn2 & Ascl1
for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 70 --linethick 1 --readext 100 --color blue --rdbexpt "Mazzoni EB+12hrDox(iAscl1.V5) Ascl1 Ainv15(iAscl1.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_iAscl1-12hr-ChIPseq}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 95 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_iNgn2-12hr-ChIPseq}; done

###### ATAC-seq
for i in *ordered; do j=$(basename $i); java -Xmx35G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 80 --linethick 1 --readext 100 --color red --rdbexpt "Ohler EB ATACseq Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie2_unique" --peaks $i --out ${j/.ordered/_EB-ATACSeq}; done

for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 50 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+12hrDox(iAscl1.V5) ATACseq Ainv15(iAscl1.V5);bowtie2_unique" --peaks $i --out ${j/.ordered/_iA-12hr-ATACSeq}; done

for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 40 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) ATACseq Ainv15(iFlag.Ngn2);bowtie2_unique" --peaks $i --out ${j/.ordered/_iN-12hr-ATACSeq}; done

for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 50 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) ATACseq Ainv15(iAscl1.V5);bowtie2_unique" --peaks $i --out ${j/.ordered/_iA-48hr-ATACSeq}; done

for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 50 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) ATACseq Ainv15(iFlag.Ngn2);bowtie2_unique" --peaks $i --out ${j/.ordered/_iN-48hr-ATACSeq}; done


###### H3K27ac
for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 100 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB H3K27ac Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K27ac-EB-ChIPseq}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 75 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) H3K27ac Ainv15(iAscl1.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K27ac-iA+48hr-ChIPseq}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 55 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) H3K27ac Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K27ac-iN+48hr-ChIPseq}; done


###### Onecut
for I in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar  org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10"  --win 1000 --bins 500 --profiler simplechipseq --batch --nocolorbar --linemin 5 --linemax 76 --linethick 1 --readext 100 --color4 220 20 60 255 --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) Onecut2 Ainv15(iAscl1.V5);bowtie_unique"  --peaks $I --out ${I/.ordered/_Onecut2-iA+48hr-ChIPseq}; done
for I in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar  org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10"  --win 1000 --bins 500 --profiler simplechipseq --batch --nocolorbar --linemin 5 --linemax 128 --linethick 1 --readext 100 --color4 220 20 60 255 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) Onecut2 Ainv15(iFlag.Ngn2);bowtie_unique"  --peaks $I --out ${I/.ordered/_Onecut2-iN+48hr-ChIPseq}; done


rm *points.txt 
rm *profiles.txt 
rm *matrix.peaks
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done

