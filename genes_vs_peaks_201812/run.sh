
bindingsites="bindingsites.list"
genesets="genesets.list"

printf "Peaks\tGeneSet\tTotalSites\tOverlapSites\tTotalGenes\tOverlapGenes\tP-val\n"; 
while read peakfile peaklabel; do 
	totalsites=$(sed -n '$=' $peakfile);
	peakbed=${peakfile/peaks/bed};
	perl ../../utils/peaks2bed.pl $peakfile 0 >$peakbed
	bedtools intersect -u -wa -a $peakbed -b ../mm10_refseq.regdom >$peaklabel".overlaps.mm10_refseq.bed"
	bedtools intersect -u -wa -b $peakbed -a ../mm10_refseq.regdom >"mm10_refseq.overlaps."$peaklabel".bed"	
	#totalsites=$(sed -n '$=' $peaklabel".overlaps.mm10_refseq.bed")

	while read geneset genelabel; do
		totalgenes=$(sed -n '$=' $geneset);

		bedtools intersect -u -wa -a $peakbed -b $geneset >$peaklabel".overlaps."$genelabel".bed"
		bedtools intersect -u -wa -b $peakbed -a $geneset >$genelabel".overlaps."$peaklabel".bed"
		overlapsites=$(sed -n '$=' $peaklabel".overlaps."$genelabel".bed")
		overlapgenes=$(sed -n '$=' $genelabel".overlaps."$peaklabel".bed")

		p=$(/gpfs/group/sam77/default/software/greatTools/calculateBinomialP $geneset ../mm10.bed $totalsites $overlapsites)
		
		printf "$peaklabel\t$genelabel\t$totalsites\t$overlapsites\t$totalgenes\t$overlapgenes\t$p\n"; 

	done <$genesets

done <$bindingsites
