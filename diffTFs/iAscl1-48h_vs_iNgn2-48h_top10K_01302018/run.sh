cp ../iAscl1-48h_vs_iNgn2-48h_01302018/Ascl1-48hr_gt_Ngn2-48hr.peaks ./
cp ../iAscl1-48h_vs_iNgn2-48h_01302018/Ngn2-48hr_shared_Ascl1-48hr.peaks ./
cp ../iAscl1-48h_vs_iNgn2-48h_01302018/Ngn2-48hr_gt_Ascl1-48hr.peaks ./


perl ~/group/projects/es/iAscl1_iNgn2/utils/subset.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+48hr_iN_Ngn2_top10k.events Ngn2-48hr_gt_Ascl1-48hr.peaks 0 0 in > Ngn2-48hr_gt_Ascl1-48hr_inTop10k.peaks

perl ~/group/projects/es/iAscl1_iNgn2/utils/subset.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+48hr_iA_Ascl1_top10k.events Ascl1-48hr_gt_Ngn2-48hr.peaks 0 0 in > Ascl1-48hr_gt_Ngn2-48hr_inTop10k.peaks

cat ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+48hr_iN_Ngn2_top10k.events ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+48hr_iA_Ascl1_top10k.events | grep -v "#" | cut -f1 | sort | uniq -c  > tmp

awk '$1==2{print $2}' tmp  > t
perl ~/group/projects/es/iAscl1_iNgn2/utils/subset.pl t Ngn2-48hr_shared_Ascl1-48hr.peaks 0 0 in > Ngn2-48hr_shared_Ascl1-48hr_inTop10k.peaks

rm Ascl1-48hr_gt_Ngn2-48hr.peaks
rm Ngn2-48hr_gt_Ascl1-48hr.peaks
rm Ngn2-48hr_shared_Ascl1-48hr.peaks
rm t tmp

for I in *inTop10k.peaks; do sh ~/group/projects/es/iAscl1_iNgn2/utils/pointTObed.sh $I > ${I/.peaks/.bed}; done 
cat Ascl1-48hr_gt_Ngn2-48hr_inTop10k.peaks Ngn2-48hr_shared_Ascl1-48hr_inTop10k.peaks Ngn2-48hr_gt_Ascl1-48hr_inTop10k.peaks > Ngn2_Ascl1.ordered
