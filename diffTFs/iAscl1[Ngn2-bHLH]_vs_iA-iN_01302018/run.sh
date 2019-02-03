perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/process_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table -6.64 -6.64 3

## No shift from
perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" true | awk '$3<-6.64{print $0}' > noShift_tmp.peaks

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iA_Ascl1" true | awk '$3>-6.64{print $1}' | awk '$3<6.64{print $1}' > tmp

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA_Ascl1;EB+12hr_iN_Ngn2" true | awk '$3<6.64{print $1}' > t

awk 'NR==FNR{$A[$1];total=NR;next}(NR==FNR+total){$B[$1];next}(($1 in A) && ($1 in B)){print $0}' tmp t noShift_tmp.peaks > noShift.peaks
rm *tmp*
rm t

## more shift

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" true | awk '$3<-6.64{print $0}' > moreShift_tmp.peaks

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iN_Ngn2_bound.events "EB+12hr_iN_Ngn2" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" true | awk '$3<-6.64{print $1}' > tmp

awk 'NR==FNR{$A[$1];next}($1 in A){print $0}' tmp moreShift_tmp.peaks  > moreShift.peaks
rm *tmp*

## new

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" true | awk '$3<-6.64{print $0}' > newChimera_tmp.peaks

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iA_Ascl1" true | awk '$3<-6.64{print $0}' > tmp.peaks

awk 'NR==FNR{$A[$1];next}($1 in A){print $0}' tmp.peaks newChimera_tmp.peaks > t
awk 'NR==FNR{$A[$1];next}!($1 in A){print $0}' moreShift.peaks t  > newChimera.peaks

rm *tmp*


# shift

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iA_Ascl1" true | awk '$3<-6.64{print $0}' > shift_tmp.peaks

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" true | awk '$3>-6.64{print $0}' | awk '$3<6.64{print $0}' > tmp

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iA\[N\]_Ascl1\[Ngn2\]_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" true | awk '$3<6.64{print $0}' > t

#awk 'NR==FNR{$A[$1];next}($1 in A){print $0}' tmp shift_tmp.peaks > shift.peaks

awk 'NR==FNR{$A[$1];total=NR;next}(NR==FNR+total){$B[$1];next}(($1 in A) && ($1 in B)){print $0}' tmp t shift_tmp.peaks > shift.peaks

rm *tmp*
rm t



# No Shift_to

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iN_Ngn2_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iN_Ngn2;EB+12hr_iA[N]_Ascl1[Ngn2]" true | awk '$3<-6.64{print $0}' > noShift_to_tmp.peaks 

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iN_Ngn2_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iA_Ascl1" true | awk '$3>-6.64{print $0}' | awk '$3<6.64{print $0}'> tmp

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table EB+12hr_iN_Ngn2_bound.events "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iN_Ngn2;EB+12hr_iA_Ascl1" true | awk '$3<-6.64{print $0}' > t

awk 'NR==FNR{$A[$1];total=NR;next}(NR==FNR+total){$B[$1];next}(($1 in A) && ($1 in B)){print $0}' tmp t noShift_to_tmp.peaks > noShift_to.peaks
rm *tmp*

rm t


### All shared

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_01302018/Ngn2-12hr_shared_Ascl1-12hr.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iA_Ascl1" true | awk '$3>-6.64{print $0}' | awk '$3<6.64{print $0}' > tmpA

perl /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/extract_from_multiGPS.pl ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017.all.events.table ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_01302018/Ngn2-12hr_shared_Ascl1-12hr.peaks "EB+12hr_iA[N]_Ascl1[Ngn2]" "EB+12hr_iA[N]_Ascl1[Ngn2];EB+12hr_iN_Ngn2" true | awk '$3>-6.64{print $0}' | awk '$3<6.64{print $0}' > tmpN


awk 'NR==FNR{$A[$1];total=NR;next}(NR==FNR+total){$B[$1];next}(($1 in A) && ($1 in B)){print $0}' tmpA tmpN ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_01302018/Ngn2-12hr_shared_Ascl1-12hr.peaks  > all_shared_relaxed.peaks

rm *tmp*
rm *events
