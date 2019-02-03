# get Brn2 classes
cp ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Brn2_14112017/Brn2_14112017_multigps/Brn2_14112017_multigps_Brn2_iAscl1_48hr.events ./
cp ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Brn2_14112017/Brn2_14112017_multigps/Brn2_14112017_multigps_Brn2_iNgn2_48hr.events ./

grep -v "#" Brn2_14112017_multigps_Brn2_iAscl1_48hr.events | cut -f1 > t
grep -v "#" Brn2_14112017_multigps_Brn2_iNgn2_48hr.events | cut -f1 > p
cat t p | sort | uniq -c | sed 's/^\s\s*//' | sed 's/\s\s*/\t/' | awk '$1==2{print $2}' > Brn2_iA_iN_shared.peaks
rm t
rm p


grep -v "#" ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Brn2_14112017/Brn2_14112017_multigps/Brn2_14112017_multigps_Brn2_iAscl1_48hr_gt_Brn2_iNgn2_48hr.diff.events | cut -f1 > Brn2_iA_gt_iN.peaks
grep -v "#" ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Brn2_14112017/Brn2_14112017_multigps/Brn2_14112017_multigps_Brn2_iNgn2_48hr_gt_Brn2_iAscl1_48hr.diff.events | cut -f1 > Brn2_iN_gt_iA.peaks

cat Brn2_iA_gt_iN.peaks Brn2_iN_gt_iA.peaks | sort | uniq > tmp
awk 'NR==FNR{$A[$1];next}!($1 in A){print $0}' tmp Brn2_iA_iN_shared.peaks > t
mv t Brn2_iA_iN_shared.peaks



