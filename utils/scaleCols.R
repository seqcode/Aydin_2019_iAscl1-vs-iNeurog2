args <- commandArgs(TRUE)

f=args[1]


data = as.matrix(read.table(f,header=TRUE,row.names=1))
data[1,]
dat=scale(t(data), center = TRUE, scale = TRUE)
#print.matrix(dat, rowlab=rownames(data), collab=colnames(data),quote=TRUE, right=FALSE)

write.table(t(dat),file="tmp.mat",sep="\t",quote=FALSE)
