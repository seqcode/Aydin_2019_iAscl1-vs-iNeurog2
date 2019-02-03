#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb


cd ~/group/projects/es/iAscl1_iNgn2/motifs/motif-scanning

mkdir count-matrices;
grep overlaps testpeaks.list >testpeaks.downstream-overlaps.list 
while read i j; do 
    echo $i; 
    jb=$(basename $j);
    #Assume sequence is generated from above
    java org.seqcode.motifs.MotifAnalysisMultiMotif --species "Mus musculus;mm10" --back ~/group/data/general/backgroundmodels/mm8.back --win 150 --motiffile cognate.motifs  --motifthres all.mthres --threslevel 0.01 --peaks $j --peakseq seqs/$jb".seq" --neg random.10K.150bp.reg --negseq seqs/random.10K.150bp.seq --countpattern >count-matrices/cognate-motifs_at_$i.txt;
done <testpeaks.downstream-overlaps.list

cd count-matrices
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Brn2_ia_gt_in_overlaps_Ascl1-12hr_gt_Ngn2-12hr.txt 9 10 >../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Brn2_ia_gt_in_overlaps_Ascl1-48hr_gt_Ngn2-48hr.txt 9 10 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Brn2_in_gt_ia_overlaps_Ngn2-12hr_gt_Ascl1-12hr.txt 8 11 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Brn2_in_gt_ia_overlaps_Ngn2-48hr_gt_Ascl1-48hr.txt 8 11 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Ebf2_ia_gt_in_overlaps_Ascl1-12hr_gt_Ngn2-12hr.txt 9 12 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Ebf2_ia_gt_in_overlaps_Ascl1-48hr_gt_Ngn2-48hr.txt 9 12 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Ebf2_in_gt_ia_overlaps_Ngn2-12hr_gt_Ascl1-12hr.txt 8 13 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Ebf2_in_gt_ia_overlaps_Ngn2-48hr_gt_Ascl1-48hr.txt 8 13 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Onecut2_ia_gt_in_overlaps_Ascl1-12hr_gt_Ngn2-12hr.txt 9 14 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Onecut2_ia_gt_in_overlaps_Ascl1-48hr_gt_Ngn2-48hr.txt 9 14 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Onecut2_in_gt_ia_overlaps_Ngn2-12hr_gt_Ascl1-12hr.txt 8 15 >>../cooccurrence-summary.txt
perl ../../../utils/motifCountMatrixCoOccurrence.pl count-cognate-motifs_at_Onecut2_in_gt_ia_overlaps_Ngn2-48hr_gt_Ascl1-48hr.txt 8 15 >>../cooccurrence-summary.txt

