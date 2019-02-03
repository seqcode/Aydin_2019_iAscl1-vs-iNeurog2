#### This job submits a sequnwinder job

### Output is a folder with SeqUnwinder output

### Please provide the following parameters

## Peak subsets
AgtNnooverBrn2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Brn2_vs_iA_and_iN_01302018/Ascl1-48hr_gt_Ngn2-48hr_nooverlap_Brn2_ia_gt_in.peaks"
AgtNoverBrn2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Brn2_vs_iA_and_iN_01302018/Ascl1-48hr_gt_Ngn2-48hr_overlaps_Brn2_ia_gt_in.peaks"
AgtNnooverEbf2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Ebf2_vs_iA_and_iN_01302018/Ascl1-48hr_gt_Ngn2-48hr_nooverlap_Ebf2_ia_gt_in.peaks"
AgtNoverEbf2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Ebf2_vs_iA_and_iN_01302018/Ascl1-48hr_gt_Ngn2-48hr_overlaps_Ebf2_ia_gt_in.peaks"
AgtNnooverOnecut2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Ascl1-48hr_gt_Ngn2-48hr_nooverlap_Onecut2_ia_gt_in.peaks"
AgtNoverOnecut2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Ascl1-48hr_gt_Ngn2-48hr_overlaps_Onecut2_ia_gt_in.peaks"

#Basic parameters
seq="/gpfs/group/sam77/default/genomes/mm10/"
geninfo="/gpfs/group/sam77/default/genomes/mm10/mm10.info"
memepath="/gpfs/group/sam77/default/software/meme_4.11.3/bin/"

###########


#Edit labels here according to subset
curr_dir=$(pwd)
awk '{print $1"\tAgtNnooverBrn2"}' $AgtNnooverBrn2 > peaks_for_sequnwinder_B.txt
awk '{print $1"\tAgtNoverBrn2"}' $AgtNoverBrn2 >> peaks_for_sequnwinder_B.txt
awk '{print $1"\tAgtNnooverEbf2"}' $AgtNnooverEbf2 > peaks_for_sequnwinder_E.txt
awk '{print $1"\tAgtNoverEbf2"}' $AgtNoverEbf2 >> peaks_for_sequnwinder_E.txt
awk '{print $1"\tAgtNnooverOnecut"}' $AgtNnooverOnecut2 > peaks_for_sequnwinder_O.txt
awk '{print $1"\tAgtNoverOnecut"}' $AgtNoverOnecut2 >> peaks_for_sequnwinder_O.txt


fac="AgtN_vs_Brn2"
peaks="$curr_dir"/peaks_for_sequnwinder_B.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 

fac="AgtN_vs_Ebf2"
peaks="$curr_dir"/peaks_for_sequnwinder_E.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 

fac="AgtN_vs_Onecut2"
peaks="$curr_dir"/peaks_for_sequnwinder_O.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 


