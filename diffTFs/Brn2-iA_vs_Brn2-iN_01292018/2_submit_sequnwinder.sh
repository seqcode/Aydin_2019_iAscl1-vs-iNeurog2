#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=4
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=70gb

module load r/3.4
module load python/2.7.8

cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/heatmaps/Brn2_chipseq_overlap_iA_vs_iN_01292017

#### This job submits a sequnwinder job

### Output is a folder with SeqUnwinder output

### Please provide the following parameters

seq="/gpfs/group/sam77/default/genomes/mm10"
fac="Brn2"
memepath="/gpfs/group/sam77/default/software/meme_4.11.3/bin/"
## This is the output of 1_overlap_chipseq_in_iA_vs_iN_lines.sh
AgtNPeaks="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/heatmaps/Brn2_chipseq_overlap_iA_vs_iN_01292017/Brn2_ia_gt_in.peaks"
## This is the output of 1_overlap_chipseq_in_iA_vs_iN_lines.sh
SharedPeaks="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/heatmaps/Brn2_chipseq_overlap_iA_vs_iN_01292017/Brn2_ia_in_shared.peaks"
## This is the output of 1_overlap_chipseq_in_iA_vs_iN_lines.sh
NgtAPeaks="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/heatmaps/Brn2_chipseq_overlap_iA_vs_iN_01292017/Brn2_in_gt_ia.peaks"
geninfo="/gpfs/group/sam77/default/genomes/mm10/mm10.info"

###########


curr_dir=$(pwd)
awk '{print $1"\tAgtN"}' $AgtNPeaks > peaks_for_sequnwinder.txt
awk '{print $1"\tNgtA"}' $NgtAPeaks >> peaks_for_sequnwinder.txt
awk '{print $1"\tShared"}' $SharedPeaks >> peaks_for_sequnwinder.txt

peaks="$curr_dir"/peaks_for_sequnwinder.txt
qsub -v peaks="$peaks",seq="$seq",geninfo="$geninfo",fac="$fac",memepath="$memepath",curr_dir="$curr_dir" $curr_dir/sequnwinder.sh 
