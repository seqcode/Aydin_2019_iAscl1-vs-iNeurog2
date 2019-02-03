#### This job submits a sequnwinder job

### Output is a folder with SeqUnwinder output

### Please provide the following parameters

fac="Brn2"

## Peak subsets
AgtNno="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Onecut2_ia_gt_in_nooverlap_Ascl1-48hr_gt_Ngn2-48hr.peaks"
AgtNover="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Onecut2_ia_gt_in_overlaps_Ascl1-48hr_gt_Ngn2-48hr.peaks"
NgtAno="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Onecut2_in_gt_ia_nooverlap_Ngn2-48hr_gt_Ascl1-48hr.peaks"
NgtAover="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_iA_and_iN_01302018/Onecut2_in_gt_ia_overlaps_Ngn2-48hr_gt_Ascl1-48hr.peaks"

#Basic parameters
seq="/gpfs/group/sam77/default/genomes/mm10/"
geninfo="/gpfs/group/sam77/default/genomes/mm10/mm10.info"
memepath="/gpfs/group/sam77/default/software/meme_4.11.3/bin/"

###########


#Edit labels here according to subset
curr_dir=$(pwd)
awk '{print $1"\tAgtN;nooverlap"}' $AgtNno > peaks_for_sequnwinder.txt
awk '{print $1"\tAgtN;overlap"}' $AgtNover >> peaks_for_sequnwinder.txt
awk '{print $1"\tNgtA;nooverlap"}' $NgtAno >> peaks_for_sequnwinder.txt
awk '{print $1"\tNgtA;overlap"}' $NgtAover >> peaks_for_sequnwinder.txt

peaks="$curr_dir"/peaks_for_sequnwinder.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 

