
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.all.events.table Ngn2-48hr_gt_Ascl1-48hr_inTop10k.peaks  "EB+48hr_iN_Ngn2" "EB+48hr_iN_Ngn2;EB+48hr_iA_Ascl1" sig | grep "Infinity" > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.all.events.table Ngn2-48hr_gt_Ascl1-48hr_inTop10k.peaks "EB+48hr_iN_Ngn2" "EB+48hr_iN_Ngn2;EB+48hr_iA_Ascl1" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp

mv tmp Ngn2-48hr_gt_Ascl1-48hr_inTop10k.peaks

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.all.events.table Ascl1-48hr_gt_Ngn2-48hr_inTop10k.peaks "EB+48hr_iA_Ascl1" "EB+48hr_iA_Ascl1;EB+48hr_iN_Ngn2" sig |  grep "Infinity" > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.all.events.table Ascl1-48hr_gt_Ngn2-48hr_inTop10k.peaks "EB+48hr_iA_Ascl1" "EB+48hr_iA_Ascl1;EB+48hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp

mv tmp Ascl1-48hr_gt_Ngn2-48hr_inTop10k.peaks

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.all.events.table Ngn2-48hr_shared_Ascl1-48hr_inTop10k.peaks  "EB+48hr_iN_Ngn2" "EB+48hr_iN_Ngn2;EB+48hr_iA_Ascl1" sig | grep "Infinity" > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.all.events.table Ngn2-48hr_shared_Ascl1-48hr_inTop10k.peaks "EB+48hr_iN_Ngn2" "EB+48hr_iN_Ngn2;EB+48hr_iA_Ascl1" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp

mv tmp Ngn2-48hr_shared_Ascl1-48hr_inTop10k.peaks
