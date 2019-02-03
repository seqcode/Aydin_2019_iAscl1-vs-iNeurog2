library(edgeR)
args <- commandArgs(TRUE)
raw <- read.delim(args[1], row.names="Region")

y <- DGEList(raw)
group <- factor(c("0","0","1","1","2","2","3","3","4","4","5","5","6","6"))
design <- model.matrix(~group)

y <- calcNormFactors(y, method="TMM") # TMM method 

y$sample
