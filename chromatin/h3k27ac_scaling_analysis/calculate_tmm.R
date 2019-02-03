library(edgeR)
args <- commandArgs(TRUE)
raw <- read.delim(args[1], row.names="Region")

y <- DGEList(raw)
y <- calcNormFactors(y, method="TMM") # TMM method 

y$sample
