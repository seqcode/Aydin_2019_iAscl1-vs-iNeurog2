library(dplyr)
library(ggplot2)
library(tidyr)

Brn2_iAscl1 <- read.table("BRN2_27072017_multigps_Brn2_iAscl1_48hr_5kb.metaprofile", header=TRUE)
Brn2_iNgn2 <- read.table("BRN2_27072017_multigps_Brn2_iNgn2_48hr_5kb.metaprofile", header=TRUE)

Brn2_iAscl1_48hr_gt_Brn2_iNgn2 <- read.table("BRN2_27072017_multigps_Brn2_iAscl1_48hr_gt_Brn2_iNgn2_48hr.diff_5kb.metaprofile", header=TRUE)
Brn2_iNgn2_48hr_gt_Brn2_iAscl1 <- read.table("BRN2_27072017_multigps_Brn2_iNgn2_48hr_gt_Brn2_iAscl1_48hr.diff_5kb.metaprofile", header=TRUE)

iA12h = "#3399FF"
iA48h = "#0033FF" 
EB = "orange" 
iN12h = "#33CC66"
iN48h="#009666"
iAN12h= "pink"
iAN48h="#CC0066"


dat = tbl_df(Brn2_iAscl1)
dat = dat %>% rename(oh1 = X0h.1.signal,oh2= X0h.2.signal, ia12h1 = ia12h.1.signal, ia12h2 = ia12h.2.signal, ia48h1 = ia48h.1.signal, ia48h2=ia48h.2.signal, 
                     in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal, 
                     ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)

dat = dat %>% mutate(oh1=oh1/17.5215,oh2=oh2/11.9613,ia12h1=ia12h1/4.58819,ia12h2=ia12h2/3.62276,ia48h1=ia48h1/2.53445,ia48h2=ia48h2/3.65978,
                     in12h1=in12h1/4.54672, in12h2=in12h2/3.05384, in48h1=in48h1/3.09297, in48h2=in48h2/4.40268,
                     ian12h1=ian12h1/4.09454, ian12h2=ian12h2/2.41845, ian48h1=in48h1/1.98985, ian48h2=in48h2/2.90856)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,
                     in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,
                     ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h,ian12h,ian48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)

ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iA) sites at Dox+48h (25,310 sites)")
ggsave("Brn2_ia.png")

dat = tbl_df(Brn2_iNgn2)
dat = dat %>% rename(oh1 = X0h.1.signal,oh2= X0h.2.signal, ia12h1 = ia12h.1.signal, ia12h2 = ia12h.2.signal, ia48h1 = ia48h.1.signal, ia48h2=ia48h.2.signal, 
                     in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal, 
                     ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)

dat = dat %>% mutate(oh1=oh1/17.5215,oh2=oh2/11.9613,ia12h1=ia12h1/4.58819,ia12h2=ia12h2/3.62276,ia48h1=ia48h1/2.53445,ia48h2=ia48h2/3.65978,
                     in12h1=in12h1/4.54672, in12h2=in12h2/3.05384, in48h1=in48h1/3.09297, in48h2=in48h2/4.40268,
                     ian12h1=ian12h1/4.09454, ian12h2=ian12h2/2.41845, ian48h1=in48h1/1.98985, ian48h2=in48h2/2.90856)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,
                     in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,
                     ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)
#ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb")+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Ascl1 > Ngn2 (0h inaccessible)")
#ggsave("A_gt_N_inactive.png")
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iNgn2) sites at Dox+48h (11,237)")
ggsave("Brn2_in.png")

dat = tbl_df(Brn2_iAscl1_48hr_gt_Brn2_iNgn2)
dat = dat %>% rename(oh1 = X0h.1.signal,oh2= X0h.2.signal, ia12h1 = ia12h.1.signal, ia12h2 = ia12h.2.signal, ia48h1 = ia48h.1.signal, ia48h2=ia48h.2.signal, 
                     in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal, 
                     ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)

dat = dat %>% mutate(oh1=oh1/17.5215,oh2=oh2/11.9613,ia12h1=ia12h1/4.58819,ia12h2=ia12h2/3.62276,ia48h1=ia48h1/2.53445,ia48h2=ia48h2/3.65978,
                     in12h1=in12h1/4.54672, in12h2=in12h2/3.05384, in48h1=in48h1/3.09297, in48h2=in48h2/4.40268,
                     ian12h1=ian12h1/4.09454, ian12h2=ian12h2/2.41845, ian48h1=in48h1/1.98985, ian48h2=in48h2/2.90856)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,
                     in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,
                     ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iA) > Brn2(iN) at Dox+48h (1,901 sites)")
ggsave("Brn2_ia_gt_in.png")

dat = tbl_df(Brn2_iNgn2_48hr_gt_Brn2_iAscl1)
dat = dat %>% rename(oh1 = X0h.1.signal,oh2= X0h.2.signal, ia12h1 = ia12h.1.signal, ia12h2 = ia12h.2.signal, ia48h1 = ia48h.1.signal, ia48h2=ia48h.2.signal, 
                     in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal, 
                     ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)

dat = dat %>% mutate(oh1=oh1/17.5215,oh2=oh2/11.9613,ia12h1=ia12h1/4.58819,ia12h2=ia12h2/3.62276,ia48h1=ia48h1/2.53445,ia48h2=ia48h2/3.65978,
                     in12h1=in12h1/4.54672, in12h2=in12h2/3.05384, in48h1=in48h1/3.09297, in48h2=in48h2/4.40268,
                     ian12h1=ian12h1/4.09454, ian12h2=ian12h2/2.41845, ian48h1=in48h1/1.98985, ian48h2=in48h2/2.90856)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,
                     in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,
                     ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks =c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iN) > Brn2(iA) at Dox+48h (1,298 sites)")
ggsave("Brn2_in_gt_ia.png")
