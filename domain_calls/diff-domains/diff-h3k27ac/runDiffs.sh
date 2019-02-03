cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-h3k27ac

Rscript runEdgeR.48h.R

#Threshold/filter (2-fold, q<0.01)

perl ../../../utils/filterEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >h3k27ac.ia48-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >h3k27ac.ia48-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >h3k27ac.in48-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >h3k27ac.in48-lt-eb.domains

for i in h3k27ac.i*domains; do perl ../../../utils/regions2bed.pl $i 100 >$i".bed"; done
