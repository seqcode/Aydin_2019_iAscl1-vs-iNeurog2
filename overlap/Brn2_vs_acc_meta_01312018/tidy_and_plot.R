library("dplyr")
library("ggplot2")
library("tidyr")

Brn2_iAscl1_iNgn2_shared <- read.table("Brn2_ia_in_shared_2kb.metaprofile", header=TRUE)
Brn2_iAscl1_48hr_gt_Brn2_iNgn2 <- read.table("Brn2_ia_gt_in_2kb.metaprofile", header=TRUE)
Brn2_iNgn2_48hr_gt_Brn2_iAscl1 <- read.table("Brn2_in_gt_ia_2kb.metaprofile", header=TRUE)

iA12h = "#3399FF"
iA48h = "#0033FF" 
EB = "orange" 
iN12h = "#33CC66"
iN48h="#009666"
iAN12h= "pink"
iAN48h="#CC0066"

oh_1_signal = 26.2882
oh_2_signal = 18.5939
ia12h_1_signal = 6.28265
ia12h_2_signal = 5.43186
ia48h_1_signal = 3.90137
ia48h_2_signal = 5.42188
in12h_1_signal = 7.53529
in12h_2_signal = 5.31363
in48h_1_signal = 5.09684
in48h_2_signal = 7.0151 
ian12h_1_signal = 7.86548
ian12h_2_signal = 5.04008
ian48h_1_signal = 4.30178
ian48h_2_signal = 6.21403

dat = tbl_df(Brn2_iAscl1_iNgn2_shared)

dat = dat %>% rename(oh1=X0h.1.signal, oh2=X0h.2.signal, ia12h1=ia12h.1.signal, ia12h2=ia12h.2.signal, ia48h1=ia48h.1.signal, ia48h2=ia48h.2.signal,in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal,ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)
dat = dat %>% mutate(oh1=oh1/oh_1_signal,oh2=oh2/oh_2_signal,ia12h1=ia12h1/ia12h_1_signal,ia12h2=ia12h2/ia12h_2_signal,ia48h1=ia48h1/ia48h_1_signal,ia48h2=ia48h2/ia48h_2_signal,in12h1=in12h1/in12h_1_signal, in12h2=in12h2/in12h_2_signal, in48h1=in48h1/in48h_1_signal, in48h2=in48h2/in48h_2_signal,ian12h1=ian12h1/ian12h_1_signal, ian12h2=ian12h2/ian12h_2_signal, ian48h1=in48h1/ian48h_1_signal, ian48h2=in48h2/ian48h_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h,ian12h,ian48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)

ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iA_and_iN) shared sites at Dox+48h")
ggsave("Brn2_ia_in_shared_2kb.png")


dat = tbl_df(Brn2_iAscl1_48hr_gt_Brn2_iNgn2)

dat = dat %>% rename(oh1=X0h.1.signal, oh2=X0h.2.signal, ia12h1=ia12h.1.signal, ia12h2=ia12h.2.signal, ia48h1=ia48h.1.signal, ia48h2=ia48h.2.signal,in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal,ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)
dat = dat %>% mutate(oh1=oh1/oh_1_signal,oh2=oh2/oh_2_signal,ia12h1=ia12h1/ia12h_1_signal,ia12h2=ia12h2/ia12h_2_signal,ia48h1=ia48h1/ia48h_1_signal,ia48h2=ia48h2/ia48h_2_signal,in12h1=in12h1/in12h_1_signal, in12h2=in12h2/in12h_2_signal, in48h1=in48h1/in48h_1_signal, in48h2=in48h2/in48h_2_signal,ian12h1=ian12h1/ian12h_1_signal, ian12h2=ian12h2/ian12h_2_signal, ian48h1=in48h1/ian48h_1_signal, ian48h2=in48h2/ian48h_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h,ian12h,ian48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks = c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iA) > Brn2(iN) at Dox+48h")
ggsave("Brn2_ia_gt_in_2kb.png")

dat = tbl_df(Brn2_iNgn2_48hr_gt_Brn2_iAscl1)

dat = dat %>% rename(oh1=X0h.1.signal, oh2=X0h.2.signal, ia12h1=ia12h.1.signal, ia12h2=ia12h.2.signal, ia48h1=ia48h.1.signal, ia48h2=ia48h.2.signal,in12h1=in12h.1.signal, in12h2=in12h.2.signal, in48h1=in48h.1.signal,in48h2=in48h.2.signal,ian12h1=ian12h.1.signal, ian12h2=ian12h.2.signal, ian48h1=ian48h.1.signal, ian48h2=ian48h.2.signal)
dat = dat %>% mutate(oh1=oh1/oh_1_signal,oh2=oh2/oh_2_signal,ia12h1=ia12h1/ia12h_1_signal,ia12h2=ia12h2/ia12h_2_signal,ia48h1=ia48h1/ia48h_1_signal,ia48h2=ia48h2/ia48h_2_signal,in12h1=in12h1/in12h_1_signal, in12h2=in12h2/in12h_2_signal, in48h1=in48h1/in48h_1_signal, in48h2=in48h2/in48h_2_signal,ian12h1=ian12h1/ian12h_1_signal, ian12h2=ian12h2/ian12h_2_signal, ian48h1=in48h1/ian48h_1_signal, ian48h2=in48h2/ian48h_2_signal)
dat = dat %>% mutate(oh = (oh1+oh2)/2, ia12h = (ia12h1 +ia12h2)/2, ia48h = (ia48h1+ia48h2)/2,in12h = (in12h1 +in12h2)/2, in48h = (in48h1+in48h2)/2,ian12h = (ian12h1 +ian12h2)/2, ian48h = (ian48h1+ian48h2)/2) %>% select(offset,oh,ia12h,ia48h,in12h,in48h,ian12h,ian48h)

d = gather(dat,"class","value",2:6)
#d = d %>% filter(offset>=-100 & offset <=100)
ggplot(d,aes(x=offset,y=value,color=class))+geom_line(size=1.2)+scale_color_manual(values=c("oh"=EB,"ia12h"=iA12h,"ia48h"=iA48h,"in12h"=iN12h,"in48h"=iN48h))+scale_x_continuous(breaks =c(-100,0,100),labels = c("-1kb","0","1kb"))+xlab("Distance from TF binding site")+ylab("Normalized read density")+ggtitle("Brn2(iN) > Brn2(iA) at Dox+48h")
ggsave("Brn2_in_gt_ia_2kb.png")
