
bindingsites="bindingsites.list"
genesets="genesets.list"

numrand=10;
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
	
		for((i=0; i<=$numrand; i++)); do	
			#make a random set of peaks
			perl ~/Tools/randomGenomePositions.pl ~/group/genomes/mm10/mm10.info $totalsites 1 >randpeaks 

			bedtools intersect -u -wa -a randpeaks -b $geneset >"randpeak.overlaps.genes.bed"
			bedtools intersect -u -wa -b randpeaks -a $geneset >"genes.overlaps.randpeak.bed"
			overlapsites=$(sed -n '$=' "randpeak.overlaps.genes.bed")
			overlapgenes=$(sed -n '$=' "genes.overlaps.randpeak.bed")

			p=$(/gpfs/group/sam77/default/software/greatTools/calculateBinomialP $geneset ../mm10.bed $totalsites $overlapsites)
			
			rlabel=$peaklabel":rand"$i
			printf "$rlabel\t$genelabel\t$totalsites\t$overlapsites\t$totalgenes\t$overlapgenes\t$p\n"; 
			
			rm randpeaks "randpeak.overlaps.genes.bed" "genes.overlaps.randpeak.bed"
		done

	done <$genesets

done <$bindingsites
