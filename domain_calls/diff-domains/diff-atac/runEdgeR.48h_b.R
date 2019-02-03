#!/usr/bin/Rscript --vanilla 
# Rscript call_DE_GLM.R repCounts.txt 0.15 

library(edgeR) 
args <- commandArgs(TRUE) 

raw <- read.delim("eb-ia48h_mef-ia48h.merge.region-counts.txt", row.names="Coord") 
y <- DGEList(raw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group) 
design 
y <- calcNormFactors(y, method="TMM") # TMM method 
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL)
print("Best-fit overdispersion parameter:") 
print(y$common.dispersion) 
#y$common.dispersion = as.numeric(args[2]) 
#print("In tests, using overdispersion parameter:") 
#print(y$common.dispersion) 
fit <- glmFit(y, design, dispersion=y$common.dispersion) 

# MEF-iA vs EB-iA
calls <- glmLRT(fit, contrast=c(0,1)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="MEF-iA48hr_vs_EB-iA48hr.edgeR_GLM_DE.txt", sep="\t") 

