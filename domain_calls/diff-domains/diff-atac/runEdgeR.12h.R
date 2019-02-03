#!/usr/bin/Rscript --vanilla 
# Rscript call_DE_GLM.R repCounts.txt 0.15 

library(edgeR) 
args <- commandArgs(TRUE) 
#raw <- read.delim(args[1], row.names="Coord") 
raw <- read.delim("eb_ia12h_in12h.merge.region-counts.txt", row.names="Coord") 
y <- DGEList(raw)
group <- factor(c("0","0","1","1","2","2"))
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

# iA vs EB
calls <- glmLRT(fit, contrast=c(0,1,0)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iA12hr_vs_EB.edgeR_GLM_DE.txt", sep="\t") 
# iN vs EB
calls <- glmLRT(fit, contrast=c(0,0,1)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iN12hr_vs_EB.edgeR_GLM_DE.txt", sep="\t")
