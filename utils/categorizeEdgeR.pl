#!/usr/bin/perl
#Filter the results from a single edgeR output file
#Output genes that pass logFC and PValue thresholds

my $logFCCol = 1;
my $logCPMCol = 2;
my $pvalueCol = 5;
my $edgerFile = $ARGV[0];
my $logFCthreshold = $ARGV[1];
my $pvalthreshold = $ARGV[2];
my $skipFirst=1;

unless(open(FILE, $edgerFile)){
    die "Cannot open file\n";}

print "coord\tlogFC\tlogCPM\tcat\n";
$first=1;
while($line = <FILE>){
    chomp($line);
    if($skipFirst==1 && $first==1){ 
	$first=0;
    }else{
	@curr = split(/\t/, $line);
	$gene = $curr[0];
	$gene =~ s/\"//g;
	$logfc = $curr[$logFCCol];
	$logcpm = $curr[$logCPMCol];
	$pval = $curr[$pvalueCol];

	$cat=0;

	if( $logfc>=$logFCthreshold && $pval<=$pvalthreshold){
	    $cat=1;
	}elsif( $logfc<=(-1*$logFCthreshold) && $pval<=$pvalthreshold){
	    $cat=2;
	}

	print "$gene\t$logfc\t$logcpm\t$cat\n";
    }
}
