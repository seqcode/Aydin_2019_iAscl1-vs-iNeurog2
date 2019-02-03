#!/usr/bin/perl -w
##Extracts a subset based on a list of annotations (prints a motif if atleast one of the annotaion in the given list is present in the 3rd column)
my $input = $ARGV[0];
my $list = $ARGV[1];
unless (open(CURR, $input)) {
        die "Cannot open file: $!"; }
@linesCurr=<CURR>;
unless (open(LIST, $list)) {
        die "Cannot open file: $!"; }
@linesList=<LIST>;


my %list=();
for($j=0; $j<=$#linesList; $j++){
    @pieces = split("\t",$linesList[$j]);
    chomp($pieces[0]);
    $list{$pieces[0]}=1;
}

$record=0;
for($i=0; $i<=$#linesCurr; $i++){
    chomp($linesCurr[$i]);
    if(length($linesCurr[$i])>0){
	@x = split(/\t/, $linesCurr[$i]);
	$print = 0; ## if 1 print; else don't
	##print $x[1],"\n";
	if($#x >= 1){
		if(exists $list{$x[1]}){
			$print = 1;
		}
	}

	if($x[0] eq "DE" && $print == 1){
	    $record=1;
	}
	if($record==1){
	    print $linesCurr[$i]."\n";
	}
	if($x[0] eq "XX"){
	    $record=0;
	}
    }
}


