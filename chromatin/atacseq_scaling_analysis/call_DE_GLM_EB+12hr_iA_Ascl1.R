#!/usr/bin/Rscript --vanilla 
# Rscript call_DE_GLM.R repCounts.txt 0.15 
# Dataset: EB+12hr_iA_Ascl1
library(edgeR) 
raw <- read.delim("ia12h_0h_union.counts", row.names="Region") 

# ia12h vs. 0h
subraw = raw[,1:4]
y <- DGEList(subraw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group) 
design 
y <- calcNormFactors(y, method="TMM") # TMM method 
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL) # this only works on later versions of edgeR, which you get with R >= 2.14 
print("Best-fit overdispersion parameter:") 
print(y$common.dispersion) 
y$common.dispersion = as.numeric(0.15) 
print("In tests, using overdispersion parameter:") 
print(y$common.dispersion) 
fit <- glmFit(y, design, dispersion=y$common.dispersion) 

calls <- glmLRT(fit, contrast=c(0,1)) # later versions of edgeR (R >= 2.15) dropped the y argument in the call to glmLRT 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="ia12h_vs_0h_edgeR.tab", sep="\t") 


raw <- read.delim("ia48h_0h_union.counts", row.names="Region") 

# ia48h vs. 0h
subraw = raw[,c(1,2,5,6)]
y <- DGEList(subraw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group) 
design 
y <- calcNormFactors(y, method="TMM") # TMM method 
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL) # this only works on later versions of edgeR, which you get with R >= 2.14 
print("Best-fit overdispersion parameter:") 
print(y$common.dispersion) 
y$common.dispersion = as.numeric(0.15) 
print("In tests, using overdispersion parameter:") 
print(y$common.dispersion) 
fit <- glmFit(y, design, dispersion=y$common.dispersion) 

calls <- glmLRT(fit, contrast=c(0,1)) # later versions of edgeR (R >= 2.15) dropped the y argument in the call to glmLRT 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="ia48h_vs_0h_edgeR.tab", sep="\t") 


raw <- read.delim("in12h_0h_union.counts", row.names="Region") 

# in12h vs. 0h
subraw = raw[,c(1,2,7,8)]
y <- DGEList(subraw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group) 
design 
y <- calcNormFactors(y, method="TMM") # TMM method 
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL) # this only works on later versions of edgeR, which you get with R >= 2.14 
print("Best-fit overdispersion parameter:") 
print(y$common.dispersion) 
y$common.dispersion = as.numeric(0.15) 
print("In tests, using overdispersion parameter:") 
print(y$common.dispersion) 
fit <- glmFit(y, design, dispersion=y$common.dispersion) 

calls <- glmLRT(fit, contrast=c(0,1)) # later versions of edgeR (R >= 2.15) dropped the y argument in the call to glmLRT 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="in12h_vs_0h_edgeR.tab", sep="\t") 


raw <- read.delim("in48h_0h_union.counts", row.names="Region") 

# in48h vs. 0h
subraw = raw[,c(1,2,9,10)]
y <- DGEList(subraw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group) 
design 
y <- calcNormFactors(y, method="TMM") # TMM method 
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL) # this only works on later versions of edgeR, which you get with R >= 2.14 
print("Best-fit overdispersion parameter:") 
print(y$common.dispersion) 
y$common.dispersion = as.numeric(0.15) 
print("In tests, using overdispersion parameter:") 
print(y$common.dispersion) 
fit <- glmFit(y, design, dispersion=y$common.dispersion) 

calls <- glmLRT(fit, contrast=c(0,1)) # later versions of edgeR (R >= 2.15) dropped the y argument in the call to glmLRT 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="in48h_vs_0h_edgeR.tab", sep="\t") 

# in48h vs ia48h

raw <- read.delim("in48h_ia48h_union.counts", row.names="Region")

subraw = raw[,c(5,6,9,10)]
y <- DGEList(subraw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group) 
y <- calcNormFactors(y, method="TMM")
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL) # this only works on later versions of edgeR, which you get with R >= 2.14 
print("Best-fit overdispersion parameter:") 
print(y$common.dispersion) 
y$common.dispersion = as.numeric(0.15) 
print("In tests, using overdispersion parameter:") 
print(y$common.dispersion) 
fit <- glmFit(y, design, dispersion=y$common.dispersion) 

calls <- glmLRT(fit, contrast=c(0,1)) # later versions of edgeR (R >= 2.15) dropped the y argument in the call to glmLRT 
all_tags = topTags(calls, n=1000000)$table 
write.table(all_tags, file="in48h_vs_ia48h_edgeR.tab", sep="\t") 


# in12h vs ia12h

raw <- read.delim("in12h_ia12h_union.counts", row.names="Region")

subraw = raw[,c(3,4,8,9)]
y <- DGEList(subraw)
group <- factor(c("0","0","1","1"))
design <- model.matrix(~group)
y <- calcNormFactors(y, method="TMM")
y <- estimateGLMCommonDisp(y, design, method="deviance", robust=TRUE, subset=NULL) # this only works on later versions of edgeR, which you get with R >= 2.14 
print("Best-fit overdispersion parameter:")
print(y$common.dispersion)
y$common.dispersion = as.numeric(0.15)
print("In tests, using overdispersion parameter:")
print(y$common.dispersion)
fit <- glmFit(y, design, dispersion=y$common.dispersion)

calls <- glmLRT(fit, contrast=c(0,1)) # later versions of edgeR (R >= 2.15) dropped the y argument in the call to glmLRT 
all_tags = topTags(calls, n=1000000)$table
write.table(all_tags, file="in12h_vs_ia12h_edgeR.tab", sep="\t")
