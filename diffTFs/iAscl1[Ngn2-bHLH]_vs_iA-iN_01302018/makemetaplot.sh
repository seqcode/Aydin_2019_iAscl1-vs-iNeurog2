#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

module load r/3.4
module load python/2.7.8


cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iAscl1\[Ngn2-bHLH\]_vs_iA-iN_01302018

multi_out="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017"
outbase=$(echo "$multi_out" | sed 's/\/$//' | rev | cut -d "/" -f1 | rev)
condition_name_A="EB+12hr_iA_Ascl1"
condition_name_N="EB+12hr_iN_Ngn2"
# Name of the factors
facA="Ascl1-12hr"
facN="Ngn2-12hr"
facAN="Ascl1[Ngn2-bHLH]-12hr"
#readdb
readdbA="Mazzoni EB+12hrDox(iAscl1.V5) Ascl1 Ainv15(iAscl1.V5);bowtie_unique"
readdbN="Mazzoni EB+12hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique"
readdbAN="Mazzoni EB+12hrDox(iAscl1[bHLH:Ngn2].HA) Ascl1[bHLH:Ngn2].HA Ainv15(iAscl1[bHLH:Ngn2].HA);bowtie_unique"

cat noShift.peaks noShift_to.peaks shift.peaks newChimera.peaks >chimera_diffs.ordered
cp all_shared_relaxed.peaks all_shared_relaxed.ordered

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 70 --linethick 1 --readext 100 --color blue --rdbexpt "$readdbA" --peaks $i --out ${i/.ordered/_"$facA"-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 95 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "$readdbN" --peaks $i --out ${i/.ordered/_"$facN"-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 90 --linethick 1 --readext 100 --color4 255 0 255 255 --rdbexpt "$readdbAN" --peaks $i --out ${i/.ordered/_"$facAN"-ChIP}; done

rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done
