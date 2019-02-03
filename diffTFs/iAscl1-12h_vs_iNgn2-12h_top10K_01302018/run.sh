cp ../iAscl1-12h_vs_iNgn2-12h_01302018/Ascl1-12hr_gt_Ngn2-12hr.peaks ./
cp ../iAscl1-12h_vs_iNgn2-12h_01302018/Ngn2-12hr_shared_Ascl1-12hr.peaks ./
cp ../iAscl1-12h_vs_iNgn2-12h_01302018/Ngn2-12hr_gt_Ascl1-12hr.peaks ./

perl ~/group/projects/es/iAscl1_iNgn2/utils/subset.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iN_Ngn2_top10k.events Ngn2-12hr_gt_Ascl1-12hr.peaks 0 0 in > Ngn2-12hr_gt_Ascl1-12hr_inTop10k.peaks

perl ~/group/projects/es/iAscl1_iNgn2/utils/subset.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1_top10k.events Ascl1-12hr_gt_Ngn2-12hr.peaks 0 0 in > Ascl1-12hr_gt_Ngn2-12hr_inTop10k.peaks

cat ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iN_Ngn2_top10k.events ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1_top10k.events | grep -v "#" | cut -f1 | sort | uniq -c  > tmp

awk '$1==2{print $2}' tmp  > t
perl ~/group/projects/es/iAscl1_iNgn2/utils/subset.pl t Ngn2-12hr_shared_Ascl1-12hr.peaks 0 0 in > Ngn2-12hr_shared_Ascl1-12hr_inTop10k.peaks

rm Ascl1-12hr_gt_Ngn2-12hr.peaks
rm Ngn2-12hr_gt_Ascl1-12hr.peaks
rm Ngn2-12hr_shared_Ascl1-12hr.peaks
rm t tmp

for I in *inTop10k.peaks; do sh ~/group/projects/es/iAscl1_iNgn2/utils/pointTObed.sh $I > ${I/.peaks/.bed}; done 
