#!/usr/bin/Rscript --vanilla 
# Rscript call_DE_GLM.R repCounts.txt 0.15 

library(edgeR) 
args <- commandArgs(TRUE) 
#raw <- read.delim(args[1], row.names="Coord") 
raw <- read.delim("eb_12h_48h.merge.region-counts.txt", row.names="Coord") 
y <- DGEList(raw)
group <- factor(c("0","0","1","1","2","2","3","3","4","4"))
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

# iA-12 vs EB
calls <- glmLRT(fit, contrast=c(0,1,0,0,0)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iA12hr_vs_EB.edgeR_GLM_DE.txt", sep="\t") 
# iN-12 vs EB
calls <- glmLRT(fit, contrast=c(0,0,1,0,0)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iN12hr_vs_EB.edgeR_GLM_DE.txt", sep="\t")
# iA-12 vs iN-12
calls <- glmLRT(fit, contrast=c(0,1,-1,0,0)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iA12hr_vs_iN12hr.edgeR_GLM_DE.txt", sep="\t") 
# iA-48 vs EB
calls <- glmLRT(fit, contrast=c(0,0,0,1,0)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iA48hr_vs_EB.edgeR_GLM_DE.txt", sep="\t") 
# iN-48 vs EB
calls <- glmLRT(fit, contrast=c(0,0,0,0,1)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iN48hr_vs_EB.edgeR_GLM_DE.txt", sep="\t") 
# iA-48 vs iN-48
calls <- glmLRT(fit, contrast=c(0,0,0,1,-1)) 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="iA48hr_vs_iN48hr.edgeR_GLM_DE.txt", sep="\t") 
