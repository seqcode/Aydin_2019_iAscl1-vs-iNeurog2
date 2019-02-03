#K-mer centering (CAGSTG & CAKATG)
cd ~/group/projects/es/iAscl1_iNgn2/motifs/kmer-counts

java org.seqcode.motifs.MarkovMotifThresholdFinder --species "Mus musculus" --genome mm9 --motiffile all.motifs --back ~/group/data/general/backgroundmodels/uniform.back --win 100 --num 1000000 >motifs_uniformbg.thres

mkdir bound_kmers
java -Xmx10G org.seqcode.motifs.MotifAnalysisSandbox --species "Mus musculus;mm10" --seq ~/group/genomes/mm10 --motiffile cagstg.motif --back ~/group/data/general/backgroundmodels/uniform.back --win 20 --minscore 10.423 --printpeakclosesthits --peaks ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_top10K_01302018/Ascl1-12hr_gt_Ngn2-12hr_inTop10k.peaks >bound_kmers/Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.motifhits
java -Xmx10G org.seqcode.motifs.MotifAnalysisSandbox --species "Mus musculus;mm10" --seq ~/group/genomes/mm10 --motiffile cakatg.motif --back ~/group/data/general/backgroundmodels/uniform.back --win 20 --minscore 10.423 --printpeakclosesthits --peaks ~/group/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_top10K_01302018/Ngn2-12hr_gt_Ascl1-12hr_inTop10k.peaks >bound_kmers/Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.motifhits
cd bound_kmers
perl ~/Tools/motifhits2gff.pl Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.motifhits 50 >Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.gff
perl ~/Tools/motifhits2gff.pl Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.motifhits 50 >Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.gff

bedtools getfasta -s -fi ~/group/genomes/mm10/mm10.fa -bed Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.gff >Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.fasta
bedtools getfasta -s -fi ~/group/genomes/mm10/mm10.fa -bed Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.gff >Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.fasta
