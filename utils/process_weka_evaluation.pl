use strict;

my $events_file = $ARGV[0];
my $evaluation = $ARGV[1];
my $className1 = $ARGV[2];
my $className2 = $ARGV[3];

open(E1,$events_file);

my @events;

while(<E1>){
	if(!/^#/){
		chomp $_;
		my @pieces = split("\t",$_);
		push(@events,$pieces[0]);
	}
}

close(E1);

open(F1,$evaluation);

my @probs;
my @predictor_vals;

while(<F1>){
	chomp $_;
	if(/\s*(\d+)\s+(\d+:\?)\s+(\d+:$className1)\s+(\d+\.*\d*)/){
		my $score = $4;
		push(@probs,$score);
	}elsif(/\s*(\d+)\s+(\d+:\?)\s+(\d+:$className2)\s+(\d+\.*\d*)/){
		my $score =1-$4;
		push(@probs,$score);
	}

}


for(my $i=0; $i<=$#events; $i++){
	print $events[$i],"\t",$probs[$i],"\n";

}


