library("dplyr")
library("ggplot2")
library("tidyr")

Ascl1_gt_Ngn2_active <- read.table("Ascl1_gt_Ngn2_inTop10k_Active_2kb.metaprofile", header=TRUE)
Ascl1_gt_Ngn2_inactive <- read.table("Ascl1_gt_Ngn2_inTop10k_Inactive_2kb.metaprofile", header=TRUE)

Ngn2_Ascl1_shared_active <- read.table("Ngn2_Ascl1_inTop10k_Active_2kb.metaprofile", header=TRUE)
Ngn2_Ascl1_shared_inactive <- read.table("Ngn2_Ascl1_inTop10k_Inactive_2kb.metaprofile", header=TRUE)

Ngn2_gt_Ascl1_active <- read.table("Ngn2_gt_Ascl1_inTop10k_Active_2kb.metaprofile", header=TRUE)
Ngn2_gt_Ascl1_inactive <- read.table("Ngn2_gt_Ascl1_inTop10k_Inactive_2kb.metaprofile", header=TRUE)



iA48h = "#0033FF" 
EB = "orange" 
iN48h="#009666"

## scaling factors calculate (/group/projects/es/iAscl1_iNgn2/chromatin/h3k27ac_scaling_analysis)

K27ac_EB_1_signal = 0.9315147
K27ac_EB_2_signal = 1.0455276
K27ac_iA_48hr_1_signal = 0.9541370
K27ac_iA_48hr_2_signal = 0.9646171
K27ac_iN_48hr_1_signal = 1.0730124
K27ac_iN_48hr_2_signal = 1.0396912

dat = tbl_df(Ascl1_gt_Ngn2_active)

dat = dat %>% rename(oh1=K27ac_EB.1.signal, oh2=K27ac_EB.2.signal, ia48h1=K27ac_iA_48hr.1.signal, ia48h2=K27ac_iA_48hr.2.signal,in48h1=K27ac_iN_48hr.1.signal,in48h2=K27ac_iN_48hr.2.signal)
dat = dat %>% mutate(oh1=oh1/K27ac_EB_1_signal,oh2=oh2/K27ac_EB_2_signal,ia48h1=ia48h1/K27ac_iA_48hr_1_signal,ia48h2=ia48h2/K27ac_iA_48hr_2_signal,in48h1=in48h1/K27ac_iN_48hr_1_signal, in48h2=in48h2/K27ac_iN_48hr_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia48h = (ia48h1+ia48h2)/2, in48h = (in48h1+in48h2)/2) %>% select(offset,oh,ia48h,in48h)

d = gather(dat,"class","value",2:4)
#d = d %>% filter(offset>=-100 & offset <=100)

ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia48h"=iA48h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ascl1>Ngn2 Active")
ggsave("Ascl1_gt_Ngn2_active_2kb.png")


dat = tbl_df(Ascl1_gt_Ngn2_inactive)

dat = dat %>% rename(oh1=K27ac_EB.1.signal, oh2=K27ac_EB.2.signal, ia48h1=K27ac_iA_48hr.1.signal, ia48h2=K27ac_iA_48hr.2.signal,in48h1=K27ac_iN_48hr.1.signal,in48h2=K27ac_iN_48hr.2.signal)
dat = dat %>% mutate(oh1=oh1/K27ac_EB_1_signal,oh2=oh2/K27ac_EB_2_signal,ia48h1=ia48h1/K27ac_iA_48hr_1_signal,ia48h2=ia48h2/K27ac_iA_48hr_2_signal,in48h1=in48h1/K27ac_iN_48hr_1_signal, in48h2=in48h2/K27ac_iN_48hr_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia48h = (ia48h1+ia48h2)/2, in48h = (in48h1+in48h2)/2) %>% select(offset,oh,ia48h,in48h)

d = gather(dat,"class","value",2:4)

#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia48h"=iA48h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ascl1>Ngn2 Inactive")
ggsave("Ascl1_gt_Ngn2_inactive_2kb.png")

dat = tbl_df(Ngn2_Ascl1_shared_active)

dat = dat %>% rename(oh1=K27ac_EB.1.signal, oh2=K27ac_EB.2.signal, ia48h1=K27ac_iA_48hr.1.signal, ia48h2=K27ac_iA_48hr.2.signal,in48h1=K27ac_iN_48hr.1.signal,in48h2=K27ac_iN_48hr.2.signal)
dat = dat %>% mutate(oh1=oh1/K27ac_EB_1_signal,oh2=oh2/K27ac_EB_2_signal,ia48h1=ia48h1/K27ac_iA_48hr_1_signal,ia48h2=ia48h2/K27ac_iA_48hr_2_signal,in48h1=in48h1/K27ac_iN_48hr_1_signal, in48h2=in48h2/K27ac_iN_48hr_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia48h = (ia48h1+ia48h2)/2, in48h = (in48h1+in48h2)/2) %>% select(offset,oh,ia48h,in48h)

d = gather(dat,"class","value",2:4)

#d = d %>% filter(offset>=-100 & offset <=100)

ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia48h"=iA48h,"in48h"=iN48h))+scale_x_continuous(breaks =c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ascl1=Ngn2 Active")
ggsave("Ngn2_Ascl1_shared_active_2kb.png")

dat = tbl_df(Ngn2_Ascl1_shared_inactive)

dat = dat %>% rename(oh1=K27ac_EB.1.signal, oh2=K27ac_EB.2.signal, ia48h1=K27ac_iA_48hr.1.signal, ia48h2=K27ac_iA_48hr.2.signal,in48h1=K27ac_iN_48hr.1.signal,in48h2=K27ac_iN_48hr.2.signal)
dat = dat %>% mutate(oh1=oh1/K27ac_EB_1_signal,oh2=oh2/K27ac_EB_2_signal,ia48h1=ia48h1/K27ac_iA_48hr_1_signal,ia48h2=ia48h2/K27ac_iA_48hr_2_signal,in48h1=in48h1/K27ac_iN_48hr_1_signal, in48h2=in48h2/K27ac_iN_48hr_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia48h = (ia48h1+ia48h2)/2, in48h = (in48h1+in48h2)/2) %>% select(offset,oh,ia48h,in48h)

d = gather(dat,"class","value",2:4)

#d = d %>% filter(offset>=-100 & offset <=100)

ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia48h"=iA48h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ascl1=Ngn2 Inactive")
ggsave("Ngn2_Ascl1_shared_inactive_2kb.png")

dat = tbl_df(Ngn2_gt_Ascl1_active)

dat = dat %>% rename(oh1=K27ac_EB.1.signal, oh2=K27ac_EB.2.signal, ia48h1=K27ac_iA_48hr.1.signal, ia48h2=K27ac_iA_48hr.2.signal,in48h1=K27ac_iN_48hr.1.signal,in48h2=K27ac_iN_48hr.2.signal)
dat = dat %>% mutate(oh1=oh1/K27ac_EB_1_signal,oh2=oh2/K27ac_EB_2_signal,ia48h1=ia48h1/K27ac_iA_48hr_1_signal,ia48h2=ia48h2/K27ac_iA_48hr_2_signal,in48h1=in48h1/K27ac_iN_48hr_1_signal, in48h2=in48h2/K27ac_iN_48hr_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia48h = (ia48h1+ia48h2)/2, in48h = (in48h1+in48h2)/2) %>% select(offset,oh,ia48h,in48h)

d = gather(dat,"class","value",2:4)
#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia48h"=iA48h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ngn2>Ascl1 Active")
ggsave("Ngn2_gt_Ascl1_active_2kb.png")

dat = tbl_df(Ngn2_gt_Ascl1_inactive)

dat = dat %>% rename(oh1=K27ac_EB.1.signal, oh2=K27ac_EB.2.signal, ia48h1=K27ac_iA_48hr.1.signal, ia48h2=K27ac_iA_48hr.2.signal,in48h1=K27ac_iN_48hr.1.signal,in48h2=K27ac_iN_48hr.2.signal)
dat = dat %>% mutate(oh1=oh1/K27ac_EB_1_signal,oh2=oh2/K27ac_EB_2_signal,ia48h1=ia48h1/K27ac_iA_48hr_1_signal,ia48h2=ia48h2/K27ac_iA_48hr_2_signal,in48h1=in48h1/K27ac_iN_48hr_1_signal, in48h2=in48h2/K27ac_iN_48hr_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia48h = (ia48h1+ia48h2)/2, in48h = (in48h1+in48h2)/2) %>% select(offset,oh,ia48h,in48h)

d = gather(dat,"class","value",2:4)
#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia48h"=iA48h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ngn2>Ascl1 Inactive")
ggsave("Ngn2_gt_Ascl1_inactive_2kb.png")
