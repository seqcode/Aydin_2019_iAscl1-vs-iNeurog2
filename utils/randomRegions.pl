#!/usr/bin/perl -w
use POSIX qw(floor);

my $genomeInfo = $ARGV[0];
my $numReg = $ARGV[1];
my $regLen = $ARGV[2];
my $numChr=0;
my @lenChr=();
my @nameChr = ();
my $lenGenome=0;

unless (open(INFO, $genomeInfo)) {
	die "Cannot open file: $!"; }
while($line = <INFO>){
	@curr = split(/\s+/, $line);
	#if($#curr==1){
		$nameChr[$numChr]=$curr[0];
		$lenChr[$numChr]=$curr[1];
		$lenGenome+=$curr[1];
		$numChr++;
	#}
}
$numSamp=0;
#Randomly sample the genome positions
while($numSamp<$numReg){
	$pos = floor(rand($lenGenome));
	
	#find the chromosome name
	$cumul=0;
	for($c=0; $c<$numChr && ($cumul+$lenChr[$c])<$pos; $c++){
		$cumul+=$lenChr[$c];
	}
	$valid=0;
	if($c<$numChr){
	    $currChr = $nameChr[$c];
	    $currStart = $pos-$cumul;
	    $currEnd = $currStart+$regLen;	
	    if($currEnd<$lenChr[$c]){
		print "$currChr:$currStart-$currEnd\n";
		$valid=1;
	    }
	}

	if($valid==1){
	    $numSamp++;
	}
}

