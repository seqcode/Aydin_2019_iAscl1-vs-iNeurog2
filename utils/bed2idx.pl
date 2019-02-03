#!/usr/bin/perl

$inName = $ARGV[$i];
unless (open(IN, $inName)) {
    die "Cannot open file: $!"; }

%chrs_list;

while($currLine = <IN>){
	@curr = split(/\s+/,$currLine);
	if(!exists $chrs_list{$curr[0]}){
		$chrs_list{$curr[0]} = 1;
	}
}

close(IN);
print "chrom\tindex\tforward\treverse\tvalue\n";

foreach $c (keys %chrs_list){
	unless (open(IN, $inName)) {
    		die "Cannot open file: $!"; }
	@points=();
	$numPoints=0;
	while($currLine = <IN>){
    		@curr = split(/\s+/, $currLine);
    		$chr = $curr[0];
    		$str = $curr[5];
		if($chr eq $c){
    			if($str eq '+'){
				$strand=1;
				$fiveprime = $curr[1];
    			}else{
				$strand=0;
				$fiveprime = $curr[2];
   	 		}
    			$points[$numPoints][0]=$chr;
   	 		$points[$numPoints][1]=$fiveprime;
    			$points[$numPoints][2]=$strand;
    			$numPoints++;
		}
	}
	close(IN);

	my @sortedpoints = sort {
    		$a->[0] cmp $b->[0] || $a->[1] <=> $b->[1] 
	} @points;

	$lastIndex = -1;
	$lastChr = "NA";
	$plusCount= 0;
	$minusCount= 0;
	for($i=0; $i<$numPoints; $i++){
    		$currChr = $sortedpoints[$i][0];
    		$currIndex = $sortedpoints[$i][1];
    		if($currIndex == $lastIndex){
			if($sortedpoints[$i][2] ==1){
	    			$plusCount++;
			}else{
	    			$minusCount++;
			}
    		}else{
			#Print
			if($i>0){
	    			$total = $plusCount+$minusCount;
	    			print "$lastChr\t$lastIndex\t$plusCount\t$minusCount\t$total\n";
			}
			#Reset 
			if($sortedpoints[$i][2] ==1){
	    			$plusCount=1;
	    			$minusCount=0;
			}else{
	    			$minusCount=1;
	    			$plusCount=0;
			}
    		}
    		$lastIndex = $currIndex;
    		$lastChr = $currChr;
	}
	#print last one
	$total = $plusCount+$minusCount;
	print "$lastChr\t$lastIndex\t$plusCount\t$minusCount\t$total\n";
}

