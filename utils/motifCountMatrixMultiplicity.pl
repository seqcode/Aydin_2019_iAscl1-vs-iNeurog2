#!/usr/bin/perl

my $myFile = $ARGV[0];
my @cols = ();
for($i=1; $i<=$#ARGV; $i++){
    $cols[$i-1]=$ARGV[$i];
}

unless(open(FILE, $myFile)){
	die "Cannot open file\n";}
@lines = <FILE>;

@curr = split(/\t/, $lines[0]);
chomp($lines[0]);
my @names=();
my $nameStr="";
for($i=0; $i<=$#cols; $i++){
    $names[$i]=$curr[$cols[$i]];
    $nameStr=$nameStr.$names[$i].";";
}

$sum=0;
$totalPeaks=0;
$totalPeaksNonZero=0;
for($x=1; $x<=$#lines; $x++){
    chomp($lines[$x]);
    if($lines[$x] !~ /^#/){
	@curr = split(/\t/, $lines[$x]);
	$csum=0;
	for($i=0; $i<=$#cols; $i++){
	    $csum+=$curr[$cols[$i]];
	}
	$sum+=$csum;
	$totalPeaks++;
	if($csum>0){
	    $totalPeaksNonZero++;
	}
    }
}
$rate = $sum/$totalPeaks;
$rateNZ = $sum/$totalPeaksNonZero;
print "$myFile\t$nameStr\t$rate\t$rateNZ\n";
close(FILE);
