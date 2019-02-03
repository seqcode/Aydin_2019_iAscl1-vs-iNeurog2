#!/usr/bin/perl
#Combines files, but all files have to have the same indices or it doesn't work
my $valCol = $ARGV[0];
my $nameCol = 0;
my %output=();

my $fcount=0;
print "Coord";
for($f=1; $f<=$#ARGV; $f++){
    my $currFile = $ARGV[$f];
    print "\t$currFile";
    unless(open(FILE, $currFile)){
	die "Cannot open file\n";}

    $lineCount=0;
    while($curr=<FILE>){    
	@currLine = split(/\s+/, $curr);
	$name = $currLine[$nameCol];
	$val =$currLine[$valCol];

	if($lineCount>0){
	    if($f==1){
		$output{$name} = $name."\t".$val;
	    }else{
		$output{$name} = $output{$name}."\t".$val;
	    }
	}
	$lineCount++;
    }
    $fcount++;
    close(FILE);
}
print "\n";

foreach my $key ( keys %output ){
    print "$output{$key}\n";
}
