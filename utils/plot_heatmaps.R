library(gplots)

args <- commandArgs(TRUE)

f=args[1]
cluster=args[2]

data <- as.matrix(read.table(f, header=TRUE, sep = "\t", row.names = 1,as.is=TRUE))

#colors = c(seq(-54,-30,length=1),seq(-29.9,0,length=20),seq(0.1,30,length=20),seq(30.1,50,length=1))
#colors = c(seq(0.5,1,length=4),seq(1.01,1.5,length=2),seq(1.51,4.6,length=4))
#colors = c(seq(0,0.5,length=4),seq(0.51,1,length=4),seq(1.51,2.8,length=1))
### SewUnwinder motif heatmaps
#colors = c(seq(0,0.5,length=6),seq(0.51,3,length=1))
#colors = c(seq(0,0.5,length=6),seq(0.51,3,length=6))
## CGEnrichment ENCODE SewUnwinder
#colors = c(seq(0,1.1,length=5),seq(1.11,2.5,length=6))

# CG 2-5mer weight ENCODE SeqUnwinder
colors = c(seq(0,0.25,length=5),seq(0.251,0.5,length=5))

# CG dimer weight ENCODE SeqUnwinder
#colors = c(seq(0,0.01,length=5),seq(0.011,0.1,length=5))

#my_palette <- colorRampPalette(c("green", "red"))(n = 8)
#my_palette <- colorRampPalette(c("lightblue","red"))(n = 9)

#colors = c(seq(0,0.25,length=5),seq(0.251,0.5,length=5))
my_palette <- colorRampPalette(c("lightblue","red"))(n = 9)


if(cluster == "true"){
	distance = dist(data)
	
	cluster     = hclust(distance, method="ward")
	png(file="tmp_heatmap.png",width=1000, height=700, bg = "transparent")
	heatmap.2(data[cluster$order,],Colv=FALSE,dendrogram="none",col=greenred(75),trace="none")
	dev.off()
	rnames = rownames(data)

	write.table(rnames[cluster$order],file="cluster_order.tmp",quote=FALSE)
}else if(cluster == "falseColRange"){
	png(file="tmp_heatmap.png",width=500, height=1000, bg = "transparent")
#	heatmap.2(data,cellnote=round(data, digits = 2),notecol="black",Rowv=FALSE,Colv=FALSE,notecex=4,breaks=colors,col=my_palette,symm=F,symkey=F,symbreaks=T,dendrogram="none",trace="none")
#	heatmap.2(data,Rowv=FALSE,Colv=FALSE,sepwidth=c(0.1,0.1),
 #          sepcolor="white",
  #         colsep=1:ncol(data),
   #        rowsep=1:nrow(data),breaks=colors,col=my_palette,symm=F,symkey=F,symbreaks=T,dendrogram="none",trace="none")
	heatmap.2(data,Rowv=FALSE,Colv=FALSE,breaks=colors,col=my_palette,symm=F,symkey=F,symbreaks=T,dendrogram="none",trace="none")
	dev.off()
}else if(cluster == "false"){
	png(file="tmp_heatmap.png",width=500, height=800, bg = "transparent")
#	brks=seq(-3,3,length.out=76)
	heatmap.2(data,Rowv=FALSE,Colv=FALSE,col=blueyellow(75),dendrogram="none",trace="none",density.info='none',cexRow=1,cexCol=1,margins=c(8,14))
	dev.off()
}
