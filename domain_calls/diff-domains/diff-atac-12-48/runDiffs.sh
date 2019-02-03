
cd ~/group/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-atac-12-48

#Run edgeR
Rscript runEdgeR.R

#Threshold/filter (2-fold, q<0.01)
perl ../../../utils/filterEdgeR.pl iA12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.ia12-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iA12hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.ia12-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.ia48-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.ia48-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iN12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.in12-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iN12hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.in12-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.in48-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.in48-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iA12hr_vs_iN12hr.edgeR_GLM_DE.txt 1 0.01 >atac.ia12-gt-in12.domains
perl ../../../utils/filterEdgeR.pl iA12hr_vs_iN12hr.edgeR_GLM_DE.txt -1 0.01 >atac.ia12-lt-in12.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_iN48hr.edgeR_GLM_DE.txt 1 0.01 >atac.ia48-gt-in48.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_iN48hr.edgeR_GLM_DE.txt -1 0.01 >atac.ia48-lt-in48.domains
for i in atac.*domains; do perl ../../../utils/regions2bed.pl $i 100 >$i".bed"; done
perl ../../../utils/categorizeEdgeR.pl iA12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iA12hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iA48hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iN12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iN12hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iN48hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iA12hr_vs_iN12hr.edgeR_GLM_DE.txt 1 0.01 >iA12hr_vs_iN12hr.edgeR_GLM_DE.cats.txt
perl ../../../utils/categorizeEdgeR.pl iA48hr_vs_iN48hr.edgeR_GLM_DE.txt 1 0.01 >iA48hr_vs_iN48hr.edgeR_GLM_DE.cats.txt

#Plot scatters
Rscript plotScatters.R iA12hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iA+12h / EB )" "iAscl+12hrs vs EB" iA12hr_vs_EB.scatter.png "blue3" "red"
Rscript plotScatters.R iA48hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iA+48h / EB )" "iAscl+48hrs vs EB" iA48hr_vs_EB.scatter.png "blue3" "red"
Rscript plotScatters.R iN12hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iN+12h / EB )" "iNeurog2+12hrs vs EB" iN12hr_vs_EB.scatter.png "darkgreen" "red"
Rscript plotScatters.R iN48hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iN+48h / EB )" "iNeurog2+48hrs vs EB" iN48hr_vs_EB.scatter.png "darkgreen" "red"
Rscript plotScatters.R iA12hr_vs_iN12hr.edgeR_GLM_DE.cats.txt "log2( iA+12h / iN+12h )" "iAscl+12hrs iNeurog2+12hrs" iA12hr_vs_iN12hr.scatter.png "blue3" "darkgreen"
Rscript plotScatters.R iA48hr_vs_iN48hr.edgeR_GLM_DE.cats.txt "log2( iA+48h / iN+48h )" "iAscl+48hrs iNeurog2+48hrs" iA48hr_vs_iN48hr.scatter.png "blue3" "darkgreen"

