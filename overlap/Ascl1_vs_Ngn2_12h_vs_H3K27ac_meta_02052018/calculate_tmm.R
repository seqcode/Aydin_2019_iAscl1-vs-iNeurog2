library("edgeR")
args <- commandArgs(TRUE)
raw <- read.delim(args[1], row.names="Region")

y <- DGEList(raw)
group <- factor(c("0","1","2"))
design <- model.matrix(~group)

y <- calcNormFactors(y, method="TMM") # TMM method 

y$sample
