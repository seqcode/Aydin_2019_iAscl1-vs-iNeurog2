# This perl script takes the all.peaks multiGPS file as input and also the desired cutoff for calling significant event 
# It outputs the following files:-
# all_pass.peaks
# celltypeA_only_pass.peaks
# condition_names

use strict;
use Symbol;

my $multi_out = $ARGV[0];
my $pcutoff = $ARGV[1];
my $what_conds = $ARGV[2]; #shared across what conditions ? (eg 0:1:3)

open(I1,$multi_out);

# the value of the hash is an array, which stores the p-values for different conditions in the same of order as in conds array
my %pvales;

# Stores the number of conditions in the current MultiGPS run in the order of the design file, order is important
my @conds;


while(<I1>){
	chomp $_;
	my @pieces = split("\t",$_);
	if(/^#Condition/){
		if($pieces[1] ne "Name"){
			push(@conds,$pieces[1]);
		}
	
		#$pvales{$pieces[0]} = [$pieces[4],$pieces[8],$pieces[12]];
	}
	elsif(!/^#/){
		for(my $i=0; $i<=$#conds; $i++){
			$pvales{$pieces[0]} = [@pieces];
		}
	}
}

my $shared_file_handler = gensym;

my @con_indexes = split(":",$what_conds);

my $out_file_name = "";

my %selected_conditions;

foreach my $sel_cond (@con_indexes){
	$out_file_name = $conds[$sel_cond]."_".$out_file_name;
	$selected_conditions{$conds[$sel_cond]} = 1;
}

$out_file_name = $out_file_name."shared.peaks";

open($shared_file_handler,">$out_file_name");


foreach my $i (keys %pvales){
	
	my $select = 1;

	my @logpvals=();
	
	for(my $x=0; $x<=$#conds; $x++){
		if(exists $selected_conditions{$conds[$x]}){
			my $c = $x+1;
			my $N = $#conds+1;
			my $tmp = (4*$c)+1-1;
			push(@logpvals,$pvales{$i}->[$tmp]);
			if($pvales{$i}->[$tmp] >= $pcutoff){
				$select = 0;
			}
			else{
				my $z=0;
				for(my $y=0; $y<=$#conds; $y++){
					if($x!=$y){
						$z=$z+1;
						my $tmp_fold = (4*($N)+1)+(3*($z)-1)+(3*($N-1)*($c-1))-1;
						my $tmp_pval = (4*($N)+1)+(3*($z)-1)+(3*($N-1)*($c-1))+1-1;
						if($tmp_pval < $pcutoff){
							$select = 0;
							last;
						}
					}
				}
			}
		}
	}
	if($select == 1){
		my $tmp_out = join("\t",@logpvals);
		print $shared_file_handler $i,"\t",$tmp_out,"\n";
	}
	
}
