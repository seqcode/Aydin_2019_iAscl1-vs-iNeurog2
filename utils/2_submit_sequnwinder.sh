#### This job submits a sequnwinder job

### Output is a folder with SeqUnwinder output

### Please provide the following parameters

fac="Brn2"

## Peak subsets (e.g. the output of 1_overlap_chipseq_in_iA_vs_iN_lines.sh)
AgtNPeaks="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_ia_gt_in.peaks"
SharedPeaks="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_ia_in_shared.peaks"
NgtAPeaks="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_in_gt_ia.peaks"

#Basic parameters
seq="/gpfs/group/sam77/default/genomes/mm10/"
geninfo="/gpfs/group/sam77/default/genomes/mm10/mm10.info"
memepath="/gpfs/group/sam77/default/software/meme_4.11.3/bin/"

###########


#Edit labels here according to subset
curr_dir=$(pwd)
awk '{print $1"\tAgtN"}' $AgtNPeaks > peaks_for_sequnwinder.txt
awk '{print $1"\tNgtA"}' $NgtAPeaks >> peaks_for_sequnwinder.txt
awk '{print $1"\tshared"}' $SharedPeaks >> peaks_for_sequnwinder.txt

peaks="$curr_dir"/peaks_for_sequnwinder.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 

