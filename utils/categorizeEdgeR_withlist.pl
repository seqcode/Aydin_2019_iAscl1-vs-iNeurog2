#!/usr/bin/perl
#Categorize the results from a single edgeR output file

my $logFCCol = 1;
my $logCPMCol = 2;
my $pvalueCol = 5;
my $edgerFile = $ARGV[0];
my $listFile = $ARGV[1];
my $onlyPrintList=0;
$onlyPrintList = $ARGV[2];
my $skipFirst=1;

unless(open(FILE, $edgerFile)){
    die "Cannot open file\n";}

unless(open(LIST, $listFile)){
    die "Cannot open file\n";}

my %special=();
while($line = <LIST>){
    chomp($line);
    @curr = split(/\t/, $line);
    $special{$curr[0]}=1;
}


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
	if( $special{$gene}==1){
	    $cat=1;
	}

	if($onlyPrintList==0 ||($onlyPrintList==1 && $cat==1)){
	    print "$gene\t$logfc\t$logcpm\t$cat\n";
	}
    }
}
