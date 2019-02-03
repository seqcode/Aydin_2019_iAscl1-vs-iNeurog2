#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb

module load python


cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iBrn2_vs_iA_iN_11132018

multi_out="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/multigps_calls/iBrn2_08112018/iBrn2_08112018_multigps"
outbase=$(echo "$multi_out" | sed 's/\/$//' | rev | cut -d "/" -f1 | rev)
condition_name_A="Brn2_iAscl1_48hr"
condition_name_N="Brn2_iNgn2_48hr"
# Name of the factors
facA="Brn2-iAscl1_48hr"
facN="Brn2-iNgn2_48hr"
facAN="Brn2-iBrn2_48hr"
#readdb
readdbA="Mazzoni EB+48hrDox(iAscl1.V5) Brn2 Ainv15(iAscl1.V5);bowtie_unique"
readdbN="Mazzoni EB+48hrDox(iFlag.Ngn2) Brn2 Ainv15(iFlag.Ngn2);bowtie_unique"
readdbAN="Mazzoni EB+48hrDox(iBrn2) Brn2 Ainv15(iBrn2);bowtie_unique"

#color
color="255 140 0 255" 

# seq-code jar file
seqcodejar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/seqcode.mahonylab.jar"

cat "$facA""_gt_""$facN"".peaks"  "$facN""_shared_""$facA"".peaks"  "$facN""_gt_""$facA"".peaks" >"$facA""_""$facN"".ordered"  


for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 120 --linethick 1 --readext 100 --color4 $color --rdbexpt "$readdbA" --peaks $i --out ${i/.ordered/_"$facA"-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 106 --linethick 1 --readext 100 --color4 $color --rdbexpt "$readdbN" --peaks $i --out ${i/.ordered/_"$facN"-ChIP}; done

for i in *ordered; do java -Xmx10G -Djava.awt.headless=true -cp $seqcodejar org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10" --win 1000 --bins 100 --profiler simplechipseq --batch --nocolorbar --linemin 15 --linemax 135 --linethick 1 --readext 100 --color4 $color --rdbexpt "$readdbAN" --peaks $i --out ${i/.ordered/_"$facAN"-ChIP}; done

rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png

for i in *lines.png; do convert $i -resize 100x500! ${i/.png/_resize.png}; done
