#### This job submits a sequnwinder job

### Output is a folder with SeqUnwinder output

### Please provide the following parameters

## Peak subsets
NgtAnooverBrn2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Brn2_vs_iA_and_iN_01302018/Ngn2-48hr_gt_Ascl1-48hr_nooverlap_Brn2_in_gt_ia.peaks"
NgtAoverBrn2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Brn2_vs_iA_and_iN_01302018/Ngn2-48hr_gt_Ascl1-48hr_overlaps_Brn2_in_gt_ia.peaks"
NgtAnooverEbf2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Ebf2_vs_iA_and_iN_01302018/Ngn2-48hr_gt_Ascl1-48hr_nooverlap_Ebf2_in_gt_ia.peaks"
NgtAoverEbf2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Ebf2_vs_iA_and_iN_01302018/Ngn2-48hr_gt_Ascl1-48hr_overlaps_Ebf2_in_gt_ia.peaks"
NgtAnooverOnecut2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Ngn2-48hr_gt_Ascl1-48hr_nooverlap_Onecut2_in_gt_ia.peaks"
NgtAoverOnecut2="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Ngn2-48hr_gt_Ascl1-48hr_overlaps_Onecut2_in_gt_ia.peaks"

#Basic parameters
seq="/gpfs/group/sam77/default/genomes/mm10/"
geninfo="/gpfs/group/sam77/default/genomes/mm10/mm10.info"
memepath="/gpfs/group/sam77/default/software/meme_4.11.3/bin/"

###########


#Edit labels here according to subset
curr_dir=$(pwd)
awk '{print $1"\tNgtAnooverBrn2"}' $NgtAnooverBrn2 > peaks_for_sequnwinder_B.txt
awk '{print $1"\tNgtAoverBrn2"}' $NgtAoverBrn2 >> peaks_for_sequnwinder_B.txt
awk '{print $1"\tNgtAnooverEbf2"}' $NgtAnooverEbf2 > peaks_for_sequnwinder_E.txt
awk '{print $1"\tNgtAoverEbf2"}' $NgtAoverEbf2 >> peaks_for_sequnwinder_E.txt
awk '{print $1"\tNgtAnooverOnecut"}' $NgtAnooverOnecut2 > peaks_for_sequnwinder_O.txt
awk '{print $1"\tNgtAoverOnecut"}' $NgtAoverOnecut2 >> peaks_for_sequnwinder_O.txt


fac="NgtA_vs_Brn2"
peaks="$curr_dir"/peaks_for_sequnwinder_B.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 

fac="NgtA_vs_Ebf2"
peaks="$curr_dir"/peaks_for_sequnwinder_E.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 

fac="NgtA_vs_Onecut2"
peaks="$curr_dir"/peaks_for_sequnwinder_O.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 


