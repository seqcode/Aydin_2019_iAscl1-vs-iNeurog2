#!/usr/bin/Rscript --vanilla
# Rscript plotScatters.R

library(ggplot2)
args <- commandArgs(TRUE)

df <- read.table("Ascl1_Ngn2_12_and_48_14112017/Ascl1_Ngn2_12_and_48_14112017.replicates.counts", header = TRUE)

dfm <- (data.matrix(df)+1)
data <- sweep(dfm,MARGIN=2,FUN="/",STATS=colSums(dfm))
logdata <- log2(data*5000000)
dfx <- data.frame(logdata)


p <- ggplot(dfx, aes(x = EB.12hr_iA_Ascl1.2, y = EB.12hr_iA_Ascl1.3 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Ascl1-12h-rep1)") + ylab("log2(Ascl1-12h-rep2)")
outname = "scatters/Ascl1-12h-bioreps.png"
ggsave(outname)
cor(dfx$EB.12hr_iA_Ascl1.2, dfx$EB.12hr_iA_Ascl1.3)^2


p <- ggplot(dfx, aes(x = EB.48hr_iA_Ascl1.1, y = EB.48hr_iA_Ascl1.2 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Ascl1-48h-rep1)") + ylab("log2(Ascl1-48h-rep2)")
outname = "scatters/Ascl1-48h-bioreps.png"
ggsave(outname)
cor(dfx$EB.48hr_iA_Ascl1.1, dfx$EB.48hr_iA_Ascl1.2)^2


p <- ggplot(dfx, aes(x = EB.12hr_iN_Ngn2.1, y = EB.12hr_iN_Ngn2.3 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Neurog2-12h-rep1)") + ylab("log2(Neurog2-12h-rep2)")
outname = "scatters/Neurog2-12h-bioreps.png"
ggsave(outname)
cor(dfx$EB.12hr_iN_Ngn2.1, dfx$EB.12hr_iN_Ngn2.3)^2


p <- ggplot(dfx, aes(x = EB.48hr_iN_Ngn2.1, y = EB.48hr_iN_Ngn2.2 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Neurog2-48h-rep1)") + ylab("log2(Neurog2-48h-rep2)")
outname = "scatters/Neurog2-48h-bioreps.png"
ggsave(outname)
cor(dfx$EB.48hr_iN_Ngn2.1, dfx$EB.48hr_iN_Ngn2.2)^2


p <- ggplot(dfx, aes(x = EB.12hr_iA_Ascl1.1, y = EB.48hr_iA_Ascl1.1 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Ascl1-12h-rep1)") + ylab("log2(Ascl1-48h-rep1)")
outname = "scatters/Ascl1-12h-vs-48h.png"
ggsave(outname)
cor(dfx$EB.12hr_iA_Ascl1.1, dfx$EB.48hr_iA_Ascl1.1)^2


p <- ggplot(dfx, aes(x = EB.12hr_iN_Ngn2.1, y = EB.48hr_iN_Ngn2.1 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Neurog2-12h-rep1)") + ylab("log2(Neurog2-48h-rep1)")
outname = "scatters/Neurog2-12h-vs-48h.png"
ggsave(outname)
cor(dfx$EB.12hr_iN_Ngn2.1, dfx$EB.48hr_iN_Ngn2.1)^2


p <- ggplot(dfx, aes(x = EB.12hr_iA_Ascl1.1, y = EB.12hr_iN_Ngn2.1 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Ascl1-12h-rep1)") + ylab("log2(Neurog2-12h-rep1)")
outname = "scatters/Ascl1-vs-Neurog2-12h.png"
ggsave(outname)
cor(dfx$EB.12hr_iA_Ascl1.1, dfx$EB.12hr_iN_Ngn2.1)^2


p <- ggplot(dfx, aes(x = EB.48hr_iA_Ascl1.1, y = EB.48hr_iN_Ngn2.1 )) +
  geom_point(alpha = 0.25, shape=".") +
  xlim(0, 14) +
  ylim(0, 14) +
  theme_bw() + theme(legend.position="none") +
  theme(axis.line = element_line(colour = "black"),
    		  panel.grid.major = element_blank(),
    		  panel.grid.minor = element_blank(),
    		  panel.background = element_blank()) +
  theme(title=element_text(size=20),
        axis.text=element_text(size=14),
        axis.title=element_text(size=18,face="bold")) +
  xlab("log2(Ascl1-48h-rep1)") + ylab("log2(Neurog2-48h-rep1)")
outname = "scatters/Ascl1-vs-Neurog2-48h.png"
ggsave(outname)
cor(dfx$EB.48hr_iA_Ascl1.1, dfx$EB.48hr_iN_Ngn2.1)^2
