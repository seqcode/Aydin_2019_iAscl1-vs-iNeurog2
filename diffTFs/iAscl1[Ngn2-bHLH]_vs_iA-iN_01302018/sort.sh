
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table all_shared_relaxed.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep "Infinity" > tmp
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table all_shared_relaxed.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp
mv tmp all_shared_relaxed.peaks


perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table moreShift.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep "Infinity" > tmp
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table moreShift.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp
mv tmp moreShift.peaks 


perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table newChimera.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep "Infinity" > tmp
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table newChimera.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp
mv tmp newChimera.peaks 


perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table noShift.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep "Infinity" > tmp
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table noShift.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp
mv tmp noShift.peaks 


perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table noShift_to.peaks "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" sig | grep "Infinity" > tmp
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table noShift_to.peaks "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp
mv tmp noShift_to.peaks 


perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table shift.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep "Infinity" > tmp
perl ~/group/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table shift.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" sig | grep -v "Infinity" | sort -r -k2 -n >> tmp
mv tmp shift.peaks 

