#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

module load r/3.4
module load python/2.7.8


cd ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_top10K_01302018

cat Ascl1-12hr_gt_Ngn2-12hr_inTop10k.peaks Ngn2-12hr_shared_Ascl1-12hr_inTop10k.peaks Ngn2-12hr_gt_Ascl1-12hr_inTop10k.peaks > Ngn2_Ascl1.ordered


#Heatmaps
for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 70 --linethick 1 --readext 100 --color blue --rdbexpt "Mazzoni EB+12hrDox(iAscl1.V5) Ascl1 Ainv15(iAscl1.V5);bowtie_unique" --peaks $i --out ${i/.ordered/_Ascl1-12hr-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 95 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique" --peaks $i --out ${i/.ordered/_Ngn2-12hr-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 90 --linethick 1 --readext 100 --color4 255 0 255 255 --rdbexpt "Mazzoni EB+12hrDox(iAscl1[bHLH:Ngn2].HA) Ascl1[bHLH:Ngn2].HA Ainv15(iAscl1[bHLH:Ngn2].HA);bowtie_unique" --peaks $i --out ${i/.ordered/_Ascl1[Ngn2-bHLH]-12hr-ChIP}; done

#K-mers
for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.ConsensusMetaMaker --species "Mus musculus;mm10" --cache --seq ~/group/genomes/mm10 --profiler consensus --consensus CAGSTG --mismatch 0 --win 150 --bins 150 --nocolorbar --color blue --peaks $i --batch --out ${i/.ordered/_CAGSTG}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.ConsensusMetaMaker --species "Mus musculus;mm10" --cache --seq ~/group/genomes/mm10 --profiler consensus --consensus CAKATG --mismatch 0 --win 150 --bins 150 --nocolorbar --color4 0 125 0 255 --peaks $i --batch --out ${i/.ordered/_CAKATG}; done


rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done

