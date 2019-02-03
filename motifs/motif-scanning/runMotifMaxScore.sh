#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=10gb


cd ~/group/projects/es/iAscl1_iNgn2/motifs/motif-scanning

mkdir maxscores;
while read i j; do 
    echo $i; 
    jb=$(basename $j);
    #Assume sequence is generated from above
    java org.seqcode.motifs.MotifAnalysisMultiMotif --species "Mus musculus;mm10" --back ~/group/data/general/backgroundmodels/mm8.back --win 150 --motiffile cognate.motifs  --motifthres all.mthres --threslevel 0.1 --peakwinmaxscores --peaks $j --peakseq seqs/$jb".seq" --neg random.10K.150bp.reg --negseq seqs/random.10K.150bp.seq >maxscores/maxscores-cognate-motifs_at_$i.txt;
done <testpeaks.list
java org.seqcode.motifs.MotifAnalysisMultiMotif --species "Mus musculus;mm10" --back ~/group/data/general/backgroundmodels/mm8.back --win 150 --motiffile cognate.motifs  --motifthres all.mthres --threslevel 0.1 --peakwinmaxscores --peaks random.10K.150bp.reg --peakseq seqs/random.10K.150bp.seq --neg random.10K.150bp.reg --negseq seqs/random.10K.150bp.seq >maxscores/maxscores-cognate-motifs_at_random10K.txt;
