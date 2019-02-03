#!/usr/bin/perl
#Filter the results from a single edgeR output file
#Output genes that pass logFC and PValue thresholds

my $logFCCol = 1;
my $pvalueCol = 5;
my $edgerFile = $ARGV[0];
my $logFCthreshold = $ARGV[1];
my $pvalthreshold = $ARGV[2];
my $skipFirst=1;

unless(open(FILE, $edgerFile)){
    die "Cannot open file\n";}

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
	$pval = $curr[$pvalueCol];

	
	if( (($logFCthreshold>0 && $logfc>=$logFCthreshold) || ($logFCthreshold<0 && $logfc<=$logFCthreshold)) && $pval<=$pvalthreshold){
	    print "$gene\t$logfc\t$pval\n";
	}
    }
}
