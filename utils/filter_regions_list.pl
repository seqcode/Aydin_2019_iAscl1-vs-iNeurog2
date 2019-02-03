use strict;

my $regions = $ARGV[0];
my $filterLsit = $ARGV[1];

open(R1,$regions);
open(F1,$filterLsit);


my %filtermap;

while(<F1>){
	chomp $_;
	my @pieces = split("\t",$_);
	my @subpieces = split(":",$pieces[0]);
	if(!($subpieces[0] =~ /^chr/)){
		$subpieces[0] = "chr".$subpieces[0];	
	}
	$filtermap{$subpieces[0]} = 1;	
}

close(F1);


while(<R1>){
	chomp $_;
	my @pieces = split("\t",$_);
	my @subpieces = split(":",$pieces[0]);
	if(!($subpieces[0] =~ /^chr/)){
                $subpieces[0] = "chr".$subpieces[0];
        }

	if(!exists $filtermap{$subpieces[0]}){
		print $_,"\n";
	}

}
close(R1);
