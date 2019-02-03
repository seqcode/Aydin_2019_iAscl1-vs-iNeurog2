#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load r/3.4
module load python/2.7.8

cd ~/group/projects/es/iAscl1_iNgn2/chromatin/activity_classes/iAscl1-12hr_iNgn2-12hr_EB-activity-classes

seqcodejar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/seqcode.mahonylab.jar"

cat Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1_top10k_Active_probGtePt8.peaks >A-12.ordered
cat Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1_top10k_Inactive_probGtePt8.peaks >>A-12.ordered

##### Ngn2 & Ascl1
for i in A-12.ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 70 --linethick 1 --readext 100 --color blue --rdbexpt "Mazzoni EB+12hrDox(iAscl1.V5) Ascl1 Ainv15(iAscl1.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_iAscl1-12hr-ChIPseq}; done

#for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 95 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_iNgn2-12hr-ChIPseq}; done

###### ATAC-seq
#Old maxes for first five: 80,50,40,50,50
for i in A-12.ordered; do j=$(basename $i); java -Xmx35G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 81 --linethick 1 --readext 100 --color red --rdbexpt "Ohler EB ATACseq Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie2_unique" --peaks $i --out ${j/.ordered/_EB-ATACSeq}; done

for i in A-12.ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 46 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+12hrDox(iAscl1.V5) ATACseq Ainv15(iAscl1.V5);bowtie2_unique" --peaks $i --out ${j/.ordered/_iA-12hr-ATACSeq}; done

#for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 35 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) ATACseq Ainv15(iFlag.Ngn2);bowtie2_unique" --peaks $i --out ${j/.ordered/_iN-12hr-ATACSeq}; done

for i in A-12.ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 53 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) ATACseq Ainv15(iAscl1.V5);bowtie2_unique" --peaks $i --out ${j/.ordered/_iA-48hr-ATACSeq}; done

#for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 44 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) ATACseq Ainv15(iFlag.Ngn2);bowtie2_unique" --peaks $i --out ${j/.ordered/_iN-48hr-ATACSeq}; done

#for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 33 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+12hrDox(iAscl1[bHLH:Ngn2].HA) ATACseq Ainv15(iAscl1[bHLH:Ngn2].HA);bowtie2_unique" --peaks $i --out ${j/.ordered/_iA[N]-12hr-ATACSeq}; done

#for i in *ordered; do j=$(basename $i); java -Xmx20G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 27 --linethick 1 --readext 100 --color red --rdbexpt "Mazzoni EB+48hrDox(iAscl1[bHLH:Ngn2].HA) ATACseq Ainv15(iAscl1[bHLH:Ngn2].HA);bowtie2_unique" --peaks $i --out ${j/.ordered/_iA[N]-48hr-ATACSeq}; done


###### H3K27ac
for i in A-12.ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 100 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB H3K27ac Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K27ac-EB-ChIPseq}; done

for i in A-12.ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 75 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) H3K27ac Ainv15(iAscl1.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K27ac-iA+48hr-ChIPseq}; done

#for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 55 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) H3K27ac Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K27ac-iN+48hr-ChIPseq}; done


###### EB H3K4me1 & H3K4me2 & H3K4me3
for i in A-12.ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 25 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB H3K4me1 Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K4me1-EB-ChIPseq}; done
for i in A-12.ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 85 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB H3K4me2 Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K4me2-EB-ChIPseq}; done
for i in A-12.ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 20 --linemax 173 --linethick 1 --readext 100 --color4 120 55 55 255 --rdbexpt "Mazzoni EB H3K4me3 Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_H3K4me3-EB-ChIPseq}; done


rm *points.txt 
rm *profiles.txt 
rm *matrix.peaks
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done

