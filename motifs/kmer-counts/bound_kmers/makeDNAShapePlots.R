
library(DNAshapeR)
library(ggplot2)
library(dplyr)

predA <- getShape("Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.fasta")
write.table(pred$MGW, file = "Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.MGW.txt", sep ="\t")
write.table(pred$HelT, file = "Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.HelT.txt", sep ="\t")
write.table(pred$ProT, file = "Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.ProT.txt", sep ="\t")
write.table(pred$Roll, file = "Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.Roll.txt", sep ="\t")
write.table(pred$EP, file = "Ascl1-12hr_gt_Ngn2-12hr_inTop10k.CAGSTG.EP.txt", sep ="\t")

predN <- getShape("Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.fasta")
write.table(pred$MGW, file = "Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.MGW.txt", sep ="\t")
write.table(pred$HelT, file = "Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.HelT.txt", sep ="\t")
write.table(pred$ProT, file = "Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.ProT.txt", sep ="\t")
write.table(pred$Roll, file = "Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.Roll.txt", sep ="\t")
write.table(pred$EP, file = "Ngn2-12hr_gt_Ascl1-12hr_inTop10k.CAKATG.EP.txt", sep ="\t")

mMGW_A <- colMeans(predA$MGW, na.rm=TRUE)
mMGW_N <- colMeans(predN$MGW, na.rm=TRUE)
sdMGW_A <- apply(predA$MGW, 2, sd)
sdMGW_N <- apply(predN$MGW, 2, sd)
df <- data.frame(pos=seq.int(ncol(predA$MGW)), mMGW_A, sdMGW_A, mMGW_N, sdMGW_N)

ggplot(data=df, aes(pos, color=variable)) + geom_line(aes(y = mMGW_A, color="A>N"))+ geom_point(aes(y = mMGW_A), color="blue") + geom_line(aes(y = mMGW_N, color="N>A"))+ geom_point(aes(y = mMGW_N), color="green4") +labs(x = "Position (bp)", y = "Minor Groove Width", color = "Sites") + scale_color_manual(labels = c("A>N", "N>A"), values = c("blue", "green4"))
ggsave("A_vs_N.MGW.png")

mHelT_A <- colMeans(predA$HelT, na.rm=TRUE)
mHelT_N <- colMeans(predN$HelT, na.rm=TRUE)
sdHelT_A <- apply(predA$HelT, 2, sd)
sdHelT_N <- apply(predN$HelT, 2, sd)
df <- data.frame(pos=seq.int(ncol(predA$HelT)), mHelT_A, sdHelT_A, mHelT_N, sdHelT_N)

ggplot(data=df, aes(pos, color=variable)) + geom_line(aes(y = mHelT_A, color="A>N"))+ geom_point(aes(y = mHelT_A), color="blue") + geom_line(aes(y = mHelT_N, color="N>A"))+ geom_point(aes(y = mHelT_N), color="green4") +labs(x = "Position (bp)", y = "Helix Twist", color = "Sites") + scale_color_manual(labels = c("A>N", "N>A"), values = c("blue", "green4"))
ggsave("A_vs_N.HelT.png")

mProT_A <- colMeans(predA$ProT, na.rm=TRUE)
mProT_N <- colMeans(predN$ProT, na.rm=TRUE)
sdProT_A <- apply(predA$ProT, 2, sd)
sdProT_N <- apply(predN$ProT, 2, sd)
df <- data.frame(pos=seq.int(ncol(predA$ProT)), mProT_A, sdProT_A, mProT_N, sdProT_N)

ggplot(data=df, aes(pos, color=variable)) + geom_line(aes(y = mProT_A, color="A>N"))+ geom_point(aes(y = mProT_A), color="blue") + geom_line(aes(y = mProT_N, color="N>A"))+ geom_point(aes(y = mProT_N), color="green4") +labs(x = "Position (bp)", y = "Propeller Twist", color = "Sites") + scale_color_manual(labels = c("A>N", "N>A"), values = c("blue", "green4"))
ggsave("A_vs_N.ProT.png")

mRoll_A <- colMeans(predA$Roll, na.rm=TRUE)
mRoll_N <- colMeans(predN$Roll, na.rm=TRUE)
sdRoll_A <- apply(predA$Roll, 2, sd)
sdRoll_N <- apply(predN$Roll, 2, sd)
df <- data.frame(pos=seq.int(ncol(predA$Roll)), mRoll_A, sdRoll_A, mRoll_N, sdRoll_N)

ggplot(data=df, aes(pos, color=variable)) + geom_line(aes(y = mRoll_A, color="A>N"))+ geom_point(aes(y = mRoll_A), color="blue") + geom_line(aes(y = mRoll_N, color="N>A"))+ geom_point(aes(y = mRoll_N), color="green4") +labs(x = "Position (bp)", y = "Roll", color = "Sites") + scale_color_manual(labels = c("A>N", "N>A"), values = c("blue", "green4"))
ggsave("A_vs_N.Roll.png")

mEP_A <- colMeans(predA$EP, na.rm=TRUE)
mEP_N <- colMeans(predN$EP, na.rm=TRUE)
sdEP_A <- apply(predA$EP, 2, sd)
sdEP_N <- apply(predN$EP, 2, sd)
df <- data.frame(pos=seq.int(ncol(predA$EP)), mEP_A, sdEP_A, mEP_N, sdEP_N)

ggplot(data=df, aes(pos, color=variable)) + geom_line(aes(y = mEP_A, color="A>N"))+ geom_point(aes(y = mEP_A), color="blue") + geom_line(aes(y = mEP_N, color="N>A"))+ geom_point(aes(y = mEP_N), color="green4") +labs(x = "Position (bp)", y = "Electrostatic Potential", color = "Sites") + scale_color_manual(labels = c("A>N", "N>A"), values = c("blue", "green4"))
ggsave("A_vs_N.EP.png")
