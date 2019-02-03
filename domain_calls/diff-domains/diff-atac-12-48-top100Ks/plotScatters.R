#!/usr/bin/Rscript --vanilla 
# Rscript plotScatters.R filename ylabel title outname

library(ggplot2) 
args <- commandArgs(TRUE) 

filename <- args[1]
ylabel <- args[2]
title <- args[3]
outname <- args[4]
color1 <- args[5]
color2 <- args[6]

df <- read.table(filename, header = TRUE)
df$cat <- as.factor(df$cat)
diffs <- which(df$cat=='1' | df$cat=='2')

p <- ggplot(df, aes(x = logCPM, y = logFC, group=cat, color=cat)) + 
  scale_color_manual(breaks = c("0", "1", "2"), values=c("black", color1, color2)) +
  geom_point(alpha = 0.1, shape=".") +
  geom_point(data=df[diffs,], alpha = 0.5, shape=".") + 
  xlab("log2(mean read count)") + ylab(ylabel) + ggtitle(title) +
  xlim(-3, 8) +
  ylim(-8, 8) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=12),
        axis.title=element_text(size=16,face="bold"))
		  		   
ggsave(outname)

