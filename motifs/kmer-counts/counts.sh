#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77-himem_collab
#PBS -l mem=10gb


cd /storage/home/sam77/group/projects/es/iAscl1_iNgn2/motifs/kmer-counts

echo "CAGCTG vs Ascl1" >counts.out 
perl ~/Tools/coordPeakOverlaps.pl cagctg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1.events 1 100 |wc -l >>counts.out 

echo "CAGGTG vs Ascl1" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl caggtg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1.events 1 100 |wc -l >>counts.out 

echo "CAGATG vs Ascl1" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl cagatg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1.events 1 100 |wc -l >>counts.out 

echo "CATATG vs Ascl1" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl catatg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iA_Ascl1.events 1 100 |wc -l >>counts.out 


echo "CAGCTG vs Ngn2" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl cagctg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iN_Nng2.events 1 100 |wc -l >>counts.out 

echo "CAGGTG vs Ngn2" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl caggtg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iN_Nng2.events 1 100 |wc -l >>counts.out 

echo "CAGATG vs Ngn2" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl cagatg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iN_Nng2.events 1 100 |wc -l >>counts.out 

echo "CATATG vs Ngn2" >>counts.out 
perl ~/Tools/coordPeakOverlaps.pl catatg_mm10.motifhits ../../multigps_calls/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017/Ascl1_Ngn2_06042017_EB+12hr_iN_Nng2.events 1 100 |wc -l >>counts.out 

