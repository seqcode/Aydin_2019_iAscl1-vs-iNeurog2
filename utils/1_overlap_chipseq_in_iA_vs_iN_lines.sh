
###
# This script overlaps and plots the chip-seq binding peaks for a factor between iA and iN cell-lines
###

###
# Output is "$fac"_ia_gt_in.peaks, "$fac"_in_gt_ia.peaks, "$fac"_ia_in_shared.peaks and sorted heatmaps  
###

### Please provide this arguments before running this script
# MultiGPS output directory (This script assumes that both iA and iN datasets were run in the same MultiGPS run. If not, please re-run MultiGPS again with both the datasets in the same design file)
multi_out="/storage/home/auk262/group/projects/es/iAscl1_iNgn2/multigps_calls/BRN2_27072017/BRN2_27072017_multigps/"
# Condition name for the datasets as used in the design file
condition_name_A="Brn2_iAscl1_48hr"
condition_name_N="Brn2_iNgn2_48hr"
# Name of the factor
fac="Brn2"
## ReadDB identifier for Ascl1 and Ngn2 expts with reps merged
readdb_A="Mazzoni EB+48hrDox(iAscl1.V5) Brn2 Ainv15(iAscl1.V5);bowtie_unique"
readdb_N="Mazzoni EB+48hrDox(iFlag.Ngn2) Brn2 Ainv15(iFlag.Ngn2);bowtie_unique"
# Color code like "0 125 0 255"
color="255 99 71 255" 
# seq-code jar file
seqcodejar="/storage/home/auk262/group/projects/es/iAscl1_iNgn2/scrips/seqcode.mahonylab.jar"

################################################################################################################
# getting the base name for multigps
outbase=$(echo "$multi_out" | sed 's/\/$//' | rev | cut -d "/" -f1 | rev)
cp "$multi_out"/"$outbase"_"$condition_name_A".events ./
cp "$multi_out"/"$outbase"_"$condition_name_N".events ./

grep -v "#" "$outbase"_"$condition_name_A".events | cut -f1 > t
grep -v "#" "$outbase"_"$condition_name_N".events | cut -f1 > p
cat t p | sort | uniq -c | sed 's/^\s\s*//' | sed 's/\s\s*/\t/' | awk '$1==2{print $2}' > shared_tmp
rm t
rm p

grep -v "#" "$multi_out"/"$outbase"_"$condition_name_A"_gt_"$condition_name_N".diff.events | cut -f1 > "$fac"_ia_gt_in.peaks
grep -v "#" "$multi_out"/"$outbase"_"$condition_name_N"_gt_"$condition_name_A".diff.events | cut -f1 > "$fac"_in_gt_ia.peaks

cat "$fac"_ia_gt_in.peaks "$fac"_in_gt_ia.peaks | sort | uniq > tmp
awk 'NR==FNR{$A[$1];next}!($1 in A){print $0}' tmp shared_tmp > t
mv t "$fac"_ia_in_shared.peaks

rm shared_tmp 
rm tmp
rm "$outbase"_"$condition_name_A".events
rm "$outbase"_"$condition_name_N".events

### Now let's make the heatmaps
awk 'NR==FNR{$A[$1];next}($1 in A){print $1}' "$fac"_ia_gt_in.peaks "$multi_out"/"$outbase"_"$condition_name_A".events > "$fac"_peaks.ordered
awk 'NR==FNR{$A[$1];next}($1 in A){print $1}' "$fac"_ia_in_shared.peaks "$multi_out"/"$outbase"_"$condition_name_A".events >> "$fac"_peaks.ordered
awk 'NR==FNR{$A[$1];next}($1 in A){print $1}' "$fac"_in_gt_ia.peaks "$multi_out"/"$outbase"_"$condition_name_N".events >> "$fac"_peaks.ordered

echo "\"$readdb_A\""
### 
for I in *ordered; do java -Xmx50G -Djava.awt.headless=true -cp $seqcodejar  org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10"  --win 5000 --bins 500 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 50 --linethick 1 --readext 100 --color4 $color --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) Brn2 Ainv15(iAscl1.V5);bowtie_unique"  --peaks $I --out ${I/.ordered/_iA}; done
for I in *ordered; do java -Xmx50G -Djava.awt.headless=true -cp $seqcodejar  org.seqcode.viz.metaprofile.MetaMaker --species "Mus musculus;mm10"  --win 5000 --bins 500 --profiler simplechipseq --batch --nocolorbar --linemin 10 --linemax 50 --linethick 1 --readext 100 --color4 $color --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) Brn2 Ainv15(iFlag.Ngn2);bowtie_unique"  --peaks $I --out ${I/.ordered/_iN}; done

rm *matrix.peaks
rm *points.txt
rm *profiles.txt
rm *profile.png
