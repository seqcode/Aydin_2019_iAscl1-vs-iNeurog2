#!/usr/bin/perl

my $myFile = $ARGV[0];
my $colA=$ARGV[1];
my $colB=$ARGV[2];

unless(open(FILE, $myFile)){
	die "Cannot open file\n";}
@lines = <FILE>;

@curr = split(/\t/, $lines[0]);
chomp($lines[0]);
my $nameA = $curr[$colA];
my $nameB = $curr[$colB];

$coo=0;
$total=0;
for($x=1; $x<=$#lines; $x++){
    chomp($lines[$x]);
    if($lines[$x] !~ /^#/){
	@curr = split(/\t/, $lines[$x]);
	if($curr[$colA]>0 && $curr[$colB]>0){
	    $coo++;
	}
	$total++;
    }
}
$freq = $coo/$total;
print "$myFile\t$nameA\t$nameB\t$freq\n";
close(FILE);
