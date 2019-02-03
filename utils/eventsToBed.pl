use strict;

my $events = $ARGV[0];


open(E1,$events);

while(<E1>){
	chomp $_;
	my @pieces = split("\t",$_);
	if(!/^#/){
		my @subpieces = split(":",$pieces[0]);
		my $score =1000;
		if($#pieces >= 5){
			if($pieces[4] ne "-Infinity"){
				$score= -1*int($pieces[4]);
			}
			print $subpieces[0],"\t",$subpieces[1],"\t",$subpieces[1]+1,"\t","MULTIGPS","\t",$score,"\t","+","\n";
		}else{
			$score = 1;
			print $subpieces[0],"\t",$subpieces[1],"\t",$subpieces[1]+1,"\t","MULTIGPS","\t",$score,"\t","+","\n";
		}
	}
}

