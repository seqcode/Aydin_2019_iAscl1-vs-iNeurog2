
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table Ngn2-12hr_gt_Ascl1-12hr_inTop10k.peaks  "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" sig | grep "Infinity" > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table Ngn2-12hr_gt_Ascl1-12hr_inTop10k.peaks "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp

mv tmp Ngn2-12hr_gt_Ascl1-12hr_inTop10k.peaks

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table Ascl1-12hr_gt_Ngn2-12hr_inTop10k.peaks "EB+12hr_iA_Ascl1" "EB+12hr_iA_Ascl1;EB+12hr_iN_Ngn2" sig |  grep "Infinity" > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table Ascl1-12hr_gt_Ngn2-12hr_inTop10k.peaks "EB+12hr_iA_Ascl1" "EB+12hr_iA_Ascl1;EB+12hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp

mv tmp Ascl1-12hr_gt_Ngn2-12hr_inTop10k.peaks

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table Ngn2-12hr_shared_Ascl1-12hr_inTop10k.peaks  "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" sig | grep "Infinity" > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table Ngn2-12hr_shared_Ascl1-12hr_inTop10k.peaks "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp

mv tmp Ngn2-12hr_shared_Ascl1-12hr_inTop10k.peaks
