#!/usr/bin/Rscript --vanilla
# Rscript plotScatters.R filename ylabel title outname

library(ggplot2)
args <- commandArgs(TRUE)

filename <- args[1]
title <- args[2]
outname <- args[3]

df <- read.table(filename, header = TRUE)

p <- ggplot(df, aes(x=Group, y=SiteMaxScore)) + geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+
	geom_boxplot(width=0.1) + theme_minimal() + ggtitle(title) +
	ylab("Maximum motif log likelihood score in 150bp window around site") +
	theme(title=element_text(size=20), axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"))
p

ggsave(outname)
