cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/domain_calls/diff-domains/diff-atac

Rscript runEdgeR.12h.R
Rscript runEdgeR.48h.R

#Threshold/filter (2-fold, q<0.01)
perl ../../../utils/filterEdgeR.pl iA12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.ia12-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iA12hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.ia12-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iN12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.in12-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iN12hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.in12-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.ia48-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.ia48-lt-eb.domains
perl ../../../utils/filterEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >atac.in48-gt-eb.domains
perl ../../../utils/filterEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt -1 0.01 >atac.in48-lt-eb.domains
perl ../../../utils/filterEdgeR.pl MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.txt 1 0.01 >atac.mef-ia48-gt-eb-ia48.domains
perl ../../../utils/filterEdgeR.pl MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.txt -1 0.01 >atac.mef-ia48-lt-eb-ia48.domains

for i in atac.*domains; do perl ../../../utils/regions2bed.pl $i 100 >$i".bed"; done

perl ../../../utils/categorizeEdgeR.pl iA12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iA12hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iA48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iA48hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iN12hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iN12hr_vs_EB.edgeR_GLM_DE.cats.txt 
perl ../../../utils/categorizeEdgeR.pl iN48hr_vs_EB.edgeR_GLM_DE.txt 1 0.01 >iN48hr_vs_EB.edgeR_GLM_DE.cats.txt
perl ../../../utils/categorizeEdgeR.pl MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.txt 1 0.01 >MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.cats.txt

#Plot scatters
Rscript plotScatters.R iA12hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iA+12h / EB )" "iAscl+12hrs vs EB" iA12hr_vs_EB.scatter.png
Rscript plotScatters.R iA48hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iA+48h / EB )" "iAscl+48hrs vs EB" iA48hr_vs_EB.scatter.png
Rscript plotScatters.R iN12hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iN+12h / EB )" "iNeurog2+12hrs vs EB" iN12hr_vs_EB.scatter.png
Rscript plotScatters.R iN48hr_vs_EB.edgeR_GLM_DE.cats.txt "log2( iN+48h / EB )" "iNeurog2+48hrs vs EB" iN48hr_vs_EB.scatter.png
Rscript plotScatters.R MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.cats.txt "log2( MEF iA+48h / EB iA+48hr )" "MEF iAscl1+48h vs EB iAscl1+48hr " MEF-iA48hr_vs_EB-iA48hr.scatter.png

#Regions that overlap binding:
perl ~/Tools/coordRegionOverlaps.pl eb_ia12h_in12h.merge.reg ../../../multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+12hr_iA_Ascl1.events 1 200 > eb_ia12h_in12h.merge.with-Ascl1-12hr.reg
perl ~/Tools/coordRegionOverlaps.pl eb_ia12h_in12h.merge.reg ../../../multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+12hr_iN_Ngn2.events 1 200 > eb_ia12h_in12h.merge.with-Ngn2-12hr.reg
perl ~/Tools/coordRegionOverlaps.pl eb_ia48h_in48h.merge.reg ../../../multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+12hr_iA_Ascl1.events 1 200 > eb_ia48h_in48h.merge.with-Ascl1-12hr.reg
perl ~/Tools/coordRegionOverlaps.pl eb_ia48h_in48h.merge.reg ../../../multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+12hr_iN_Ngn2.events 1 200 > eb_ia48h_in48h.merge.with-Ngn2-12hr.reg
perl ~/Tools/coordRegionOverlaps.pl eb-ia48h_mef-ia48h.merge.reg ../../../multigps_calls/Ascl1_Ngn2_12_and_48h_14112017/Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017_EB+48hr_iA_Ascl1.events 1 200 > eb-ia48h_mef-ia48h.merge.with-Ascl1-48hr.reg

perl ../../../utils/categorizeEdgeR_withlist.pl iA12hr_vs_EB.edgeR_GLM_DE.txt eb_ia12h_in12h.merge.with-Ascl1-12hr.reg >iA12hr_vs_EB.edgeR_GLM_DE.Ascl1-12h-binding-cats.txt
perl ../../../utils/categorizeEdgeR_withlist.pl iN12hr_vs_EB.edgeR_GLM_DE.txt eb_ia12h_in12h.merge.with-Ngn2-12hr.reg >iN12hr_vs_EB.edgeR_GLM_DE.Ngn2-12h-binding-cats.txt
perl ../../../utils/categorizeEdgeR_withlist.pl iA48hr_vs_EB.edgeR_GLM_DE.txt eb_ia48h_in48h.merge.with-Ascl1-12hr.reg >iA48hr_vs_EB.edgeR_GLM_DE.Ascl1-12h-binding-cats.txt
perl ../../../utils/categorizeEdgeR_withlist.pl iN48hr_vs_EB.edgeR_GLM_DE.txt eb_ia48h_in48h.merge.with-Ngn2-12hr.reg >iN48hr_vs_EB.edgeR_GLM_DE.Ngn2-12h-binding-cats.txt
perl ../../../utils/categorizeEdgeR_withlist.pl MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.txt eb-ia48h_mef-ia48h.merge.with-Ascl1-48hr.reg >MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.Ascl1-48h-binding-cats.txt

#Plot scatters
Rscript plotScatters_singleHighlight.R iA12hr_vs_EB.edgeR_GLM_DE.Ascl1-12h-binding-cats.txt "log2( iA+12h / EB )" "iAscl+12hrs vs EB" iA12hr_vs_EB.scatter-with-binding.png "blue"
Rscript plotScatters_singleHighlight.R iA48hr_vs_EB.edgeR_GLM_DE.Ascl1-12h-binding-cats.txt "log2( iA+48h / EB )" "iAscl+48hrs vs EB" iA48hr_vs_EB.scatter-with-binding.png "blue"
Rscript plotScatters_singleHighlight.R iN12hr_vs_EB.edgeR_GLM_DE.Ngn2-12h-binding-cats.txt "log2( iN+12h / EB )" "iNeurog2+12hrs vs EB" iN12hr_vs_EB.scatter-with-binding.png "green"
Rscript plotScatters_singleHighlight.R iN48hr_vs_EB.edgeR_GLM_DE.Ngn2-12h-binding-cats.txt "log2( iN+48h / EB )" "iNeurog2+48hrs vs EB" iN48hr_vs_EB.scatter-with-binding.png "green"
Rscript plotScatters_singleHighlight.R MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.Ascl1-48h-binding-cats.txt "log2( MEF iA+48h / EB iA+48hr )" "MEF iAscl1+48h vs EB iAscl1+48hr" MEF-iA48hr_vs_EB-iA48hr.scatter-with-binding.png "blue"


#2D differentials:
cat atac.i*12*domains |cut -f1 |sort -u >12h-any-diff.domains
cat atac.i*48*domains |cut -f1 |sort -u >48h-any-diff.domains
cat atac.mef*48*domains |cut -f1 |sort -u >mef-eb-48h-any-diff.domains
perl ../../../utils/categorizeEdgeR_withlist.pl iA12hr_vs_EB.edgeR_GLM_DE.txt 12h-any-diff.domains 1 |cut -f1-2 |sort -u >tmp1
perl ../../../utils/categorizeEdgeR_withlist.pl iN12hr_vs_EB.edgeR_GLM_DE.txt 12h-any-diff.domains 1 |cut -f1-2 |sort -u |cut -f2 >tmp2
printf "coord\tiA\tiN\n" >diffs_iA12hr_and_iN12hr.txt
paste tmp1 tmp2 >>diffs_iA12hr_and_iN12hr.txt
perl ../../../utils/categorizeEdgeR_withlist.pl iA48hr_vs_EB.edgeR_GLM_DE.txt 48h-any-diff.domains 1 |cut -f1-2 |sort -u >tmp1
perl ../../../utils/categorizeEdgeR_withlist.pl iN48hr_vs_EB.edgeR_GLM_DE.txt 48h-any-diff.domains 1 |cut -f1-2 |sort -u |cut -f2 >tmp2
printf "coord\tiA\tiN\n" >diffs_iA48hr_and_iN48hr.txt
paste tmp1 tmp2 >>diffs_iA48hr_and_iN48hr.txt
rm tmp1 tmp2

Rscript plotDiffs.R diffs_iA12hr_and_iN12hr.txt "log2( iA+12h / EB )" "log2( iN+12h / EB )" "iAscl+12hrs vs iNeurog2+12hrs (differential regions only)" iA12hr_vs_iN12hr.diffs.scatter.png
Rscript plotDiffs.R diffs_iA48hr_and_iN48hr.txt "log2( iA+48h / EB )" "log2( iN+48h / EB )" "iAscl+48hrs vs iNeurog2+48hrs (diff. regions only)" iA48hr_vs_iN48hr.diffs.scatter.png

