use strict;
use List::Util 'shuffle';

my $file = $ARGV[0];
my $num = $ARGV[1];

open(F1,$file);

my %toshuffle;

while(<F1>){
	chomp $_;
	$toshuffle{$_} = 1;	
}
close(F1);

my $count=0;
foreach my $k (shuffle keys %toshuffle){
	if($count<$num){
		print $k,"\n";
	}else{
		last;
	}
	$count++;
}

