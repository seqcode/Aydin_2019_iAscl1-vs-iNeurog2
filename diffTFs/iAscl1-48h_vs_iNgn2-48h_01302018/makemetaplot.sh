#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

module load r/3.4
module load python/2.7.8


cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-48h_vs_iNgn2-48h_01302018

multi_out="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017"
outbase=$(echo "$multi_out" | sed 's/\/$//' | rev | cut -d "/" -f1 | rev)
condition_name_A="EB+48hr_iA_Ascl1"
condition_name_N="EB+48hr_iN_Ngn2"
# Name of the factors
facA="Ascl1-48hr"
facN="Ngn2-48hr"
#readdb
readdbA="Mazzoni EB+48hrDox(iAscl1.V5) Ascl1.ABCAM Ainv15(iAscl1.V5);bowtie_unique"
readdbN="Mazzoni EB+48hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique"

cat "$facA""_gt_""$facN"".peaks"  "$facN""_shared_""$facA"".peaks"  "$facN""_gt_""$facA"".peaks" >"$facA""_""$facN"".ordered"  


for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 73 --linethick 1 --readext 100 --color blue --rdbexpt "$readdbA" --peaks $i --out ${i/.ordered/_"$facA"-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 137 --linethick 1 --readext 100 --color4 0 125 0 255 --rdbexpt "$readdbN" --peaks $i --out ${i/.ordered/_"$facN"-ChIP}; done


rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done
