#!/usr/bin/perl

## Check nth column in infile for the patterns in listfile
my $infile = $ARGV[0];
my $listfile = $ARGV[1];
my $col = $ARGV[2];
my $invert=0;
if($#ARGV>2){
    if($ARGV[3] eq "-v"){
	$invert =1;
    }
}
%patterns = ();
unless (open(LIST, $listfile)) {
    die "Cannot open file: $!"; }
while($x = <LIST>){
    chomp($x);
    @curr = split(/\s+/, $x);
    $patterns{$curr[0]}=1;
}

unless (open(IN, $infile)) {
    die "Cannot open file: $!"; }
while($x = <IN>){
    chomp($x);
    @curr = split(/\s+/, $x);

    if($invert==0 && defined($patterns{$curr[$col]}) ){
	print "$x\n";
    }
    if($invert==1 && !defined($patterns{$curr[$col]})){
	print "$x\n";
    }
}
close(IN);
close(LIST);
