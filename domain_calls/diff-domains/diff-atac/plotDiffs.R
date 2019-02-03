#!/usr/bin/Rscript --vanilla 
# Rscript plotDiffs.R filename xlabel ylabel title outname

library(ggplot2) 
args <- commandArgs(TRUE) 

filename <- args[1]
xlabel <- args[2]
ylabel <- args[3]
title <- args[4]
outname <- args[5]

df <- read.table(filename, header = TRUE)

p <- ggplot(df, aes(x = iA, y = iN)) + 
  geom_point(alpha = 0.5, shape=".", color="blue") +
  xlim(-8.0, 8.0) + ylim(-8.0, 8.0) +
  xlab(xlabel) + ylab(ylabel) + ggtitle(title) +
  theme_bw() + theme(legend.position="none") +
  theme(title=element_text(size=16),
        axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))

ggsave(outname)

