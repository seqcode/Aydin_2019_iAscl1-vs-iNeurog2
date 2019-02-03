#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_collab
#PBS -l mem=10gb

module load java/jdk/1.8.0_25


cd /storage/group/sam77_collab/projects/es/iAscl1_iNgn2/motifs/kmer-counts

java -Xmx8G org.seqcode.motifs.MotifAnalysisSandbox --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --motiffile cagctg.motif --back ~/group/data/general/backgroundmodels/mm8.back --motifthres motifs.thres --threslevel 0.001 --wholegenome --printhits >cagctg_mm10.motifhits
java -Xmx8G org.seqcode.motifs.MotifAnalysisSandbox --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --motiffile cagatg.motif --back ~/group/data/general/backgroundmodels/mm8.back --motifthres motifs.thres --threslevel 0.001 --wholegenome --printhits >cagatg_mm10.motifhits
java -Xmx8G org.seqcode.motifs.MotifAnalysisSandbox --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --motiffile caggtg.motif --back ~/group/data/general/backgroundmodels/mm8.back --motifthres motifs.thres --threslevel 0.001 --wholegenome --printhits >caggtg_mm10.motifhits
java -Xmx8G org.seqcode.motifs.MotifAnalysisSandbox --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --motiffile catatg.motif --back ~/group/data/general/backgroundmodels/mm8.back --motifthres motifs.thres --threslevel 0.001 --wholegenome --printhits >catatg_mm10.motifhits

