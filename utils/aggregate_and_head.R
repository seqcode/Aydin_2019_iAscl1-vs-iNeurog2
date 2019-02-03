args <- commandArgs(TRUE)

f=args[1]

## Load the data into data.frame
dat = as.data.frame(read.table(f,header = TRUE))

### aggregate by what?? Change this everytime
aggs=aggregate(dat$Location,list(subclasses=dat$Subclass),FUN = function(x){y<-head(x,n=1300); return(y)})

## Now make out dataframe
out = data.frame(regions=as.vector(aggs$x),subclasses=as.vector(aggs$subclasses))

## Now print

write.table(out,file="tmp.out",quote = FALSE,sep = "\t",row.names = FALSE)
