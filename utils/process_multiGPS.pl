# This perl script takes the all.events.table multiGPS file as input and also the desired cutoffs for calling significant events
# It outputs the following files:-
# all_pass.peaks :- TF binding sites bound in a specified number of multiGPS conditions 
# conditionA_only_bound.events :- TF binding sites only bound in condition A (A file like this is generated for each condition) 
# conditionA_bound.events  :- TF binding sites that are bound in a given condition (A file like this is generated for each condition) 
# condition_names :- A tab file with condition names

use strict;
use Symbol;

my $multi_out = $ARGV[0];   ## MultiGPS's all.events.table
my $pcutoff = $ARGV[1]; ## P-vale cutoff neg-log (when comparing signal to input)
my $pcutoff_cond = $ARGV[2]; ## P-value cutoff neg-log (when comparing across conditions)
my $no_conds_for_multi = $ARGV[3]; ## No of conditions should a event be bound to be called shared
my $condition_matches = $ARGV[4]; ### If there are any redundent similar conditions, eg :- Esc\tES
my $Conds_to_omit_filename = $ARGV[5]; ## list of conditions to omit from this processing


open(CM1,$condition_matches);

my %track_matching_conditions; # needed later to track if the matching partner
my %map_match; # All matching conditions

while(<CM1>){
	chomp $_;
	my @pieces  = split("\t",$_);
	for(my $i=0; $i<=$#pieces; $i++){
		$track_matching_conditions{$pieces[$i]} = 0;
		if(!exists $map_match{$pieces[$i]}){
			if($i != 0 && $i != $#pieces){
				$map_match{$pieces[$i]} = (@pieces[0 .. $i-1],@pieces[$i+1 .. -1]);
			}
			elsif($i==0){
				$map_match{$pieces[$i]} = @pieces[1 .. $#pieces];
			}
			elsif($i==$#pieces){
				$map_match{$pieces[$i]} = @pieces[0 .. $#pieces-1];
			}
		}
	}
	
}

close(CM1);

open(CTO,$Conds_to_omit_filename);

my %conditions_to_omit;

while(<CTO>){
	chomp $_;
	my @pieces = split("\t",$_);
	$conditions_to_omit{$pieces[0]} = 1;
}

close(CTO);

open(I1,$multi_out);

# the value of the hash is an array, which stores the p-values for different conditions in the same of order as in conds array
my %pvales;
my %binding_event_string;  ## Hash that stores the binding events string (last column of the multiGPS output; eg 1,1,0,1)

# Stores the number of conditions in the current MultiGPS run in the order of the design file, order is important
my @conds;


while(<I1>){
	chomp $_;
	my @pieces = split("\t",$_);
	if(/^#Condition/){
		if($pieces[1] ne "Name"){
			push(@conds,join("_",@pieces[1]));
			
		}
	
		#$pvales{$pieces[0]} = [$pieces[4],$pieces[8],$pieces[12]];
	}
	elsif(!/^#/){
		for(my $i=0; $i<=$#conds; $i++){
			$pvales{$pieces[0]} = [@pieces];
			$binding_event_string{$pieces[0]} = $pieces[-1];
		}
	}
}

close(I1);

if($no_conds_for_multi >$#conds+1){
	die "Number of conditions for multi is greater than total number of conditions!!!\n";
}

## an array of file handlers, the order to be maintained as @conds
#my @file_handlers;

#for(my $i=0; $i<=$#conds; $i++){
#	my $fh_temp = gensym;
#	my $out_name = $conds[$i]."_only_pass.peaks";
#	open($fh_temp,">$out_name");
#	push(@file_handlers,$fh_temp); 

#}

my $shared_file_handler = gensym;

open($shared_file_handler,">all_shared.events");


foreach my $i (keys %pvales){

	
	my $select  = 0;   # No of consitions this binding event is multi conditionally bound

	my @logpvals=();
	
	for(my $x=0; $x<=$#conds; $x++){
		if(exists $conditions_to_omit{$conds[$x]}){
			next;
		}
		my $c = $x+1;
		my $N = $#conds+1;
		my $tmp = (4*$c)+1-1;
		push(@logpvals,$pvales{$i}->[$tmp]);
		my @binding_event_detected = split(",",$binding_event_string{$i}); 
		if($pvales{$i}->[$tmp] < $pcutoff && $binding_event_detected[$x] == 1){  ## if bound in the current condition

			my $z=0;
			my $multi_select = 1;
			for(my $y=0; $y<=$#conds; $y++){  ## Over all other conditions
				if(exists $conditions_to_omit{$conds[$y]}){
					$z++;
					next;
				}
				if($x!=$y && inList($conds[$y],$conds[$x]) ne "true"  ){
					$z++;
					my $tmp_fold = (4*($N)+1)+(3*($z)-1)+(3*($N-1)*($c-1))-1;
					my $tmp_pval = (4*($N)+1)+(3*($z)-1)+(3*($N-1)*($c-1))+1-1;
					if($i eq "chr5:100937775"){
						print $conds[$x],"\t",$conds[$y],"\t",$pvales{$i}->[$tmp_fold],"\t",$tmp_fold,"\n";
					}
					if($pvales{$i}->[$tmp_pval] < $pcutoff_cond){   # differentilly enriched among conditions
						$multi_select = 0;
					}
				}elsif($x!=$y && inList($conds[$y],$conds[$x]) eq "true"){
					$z=$z+1;
				}
			}
			if($multi_select == 1){
				if($track_matching_conditions{$conds[$x]} != 1){
					$select++;
					$track_matching_conditions{$conds[$x]} = 1; 
					foreach my $c (@{map_match{$conds[$x]}}){
						$track_matching_conditions{$c} = 1;
					}
				}
			}
			
		}
	}

	foreach my $keyy (keys %track_matching_conditions){
		$track_matching_conditions{$keyy} = 0;
	}

	if($select >= $no_conds_for_multi){
		my $tmp_out = join("\t",@logpvals);
		print $shared_file_handler $i,"\t",$tmp_out,"\n";
	}
	
}

for(my $x = 0; $x<=$#conds; $x++){
	if(exists $conditions_to_omit{$conds[$x]}){
		next;
	}
	my $fh_temp = gensym;
	my $out_name = $conds[$x]."_only_bound.events";
	my $out_name_pass = $conds[$x]."_bound.events";
	my $cond_all_pass_fh_temp = gensym;
	open($cond_all_pass_fh_temp,">$out_name_pass");
	open($fh_temp,">$out_name");
	foreach my $i (keys %pvales){
		my $select = 1;
		my $select_cond_all = 0;
		my $N = $#conds+1;
		my $c = $x+1;
		my $tmp = (4*$c)+1-1;
	
		my @binding_event_detected = split(",",$binding_event_string{$i});	
		if($pvales{$i}->[$tmp] >= $pcutoff || $binding_event_detected[$x] == 0){
			$select = 0;
		}
                else{
			$select_cond_all = 1;
			my $z=0;       
                	for(my $y=0; $y<=$#conds; $y++){
				if(exists $conditions_to_omit{$conds[$y]}){
					$z++;
					next;
				}
                		if($x!=$y && inList($conds[$x],$conds[$y]) ne "true"){
					$z++;
					my $tmp_fold = (4*($N)+1)+(3*($z)-1)+(3*($N-1)*($c-1))-1;
					my $tmp_pval = (4*($N)+1)+(3*($z)-1)+(3*($N-1)*($c-1))+1-1;
					if($i eq "chr5:100937775"){
                                                print $conds[$x],"\t",$conds[$y],"\t",$pvales{$i}->[$tmp_fold],"\t",$tmp_fold,"\t",$z,"\n";
                                        }
					if ($pvales{$i}->[$tmp_fold] < 0 && $binding_event_detected[$y] == 1){  
                				$select = 0;
						last;
					}
					elsif($pvales{$i}->[$tmp_pval] >= $pcutoff_cond){  # not differentially bound
						$select = 0;
						last;
					}
                		}elsif($x!=$y && inList($conds[$x],$conds[$y]) eq "true"){
					$z++;
				}
                	}   
                }           
                            
                if($select == 1){
			print $fh_temp $i,"\t",$pvales{$i}->[$tmp],"\n";
		}

		if($select_cond_all == 1){
			print $cond_all_pass_fh_temp $i,"\t",$pvales{$i}->[$tmp],"\n";
		}

	}
	close($fh_temp);
	close($cond_all_pass_fh_temp);
}




# closing file handlers

close($shared_file_handler);

open(C1,">condition_names");
for(my $c = 0; $c<=$#conds; $c++){
	if(exists $conditions_to_omit{$conds[$c]}){
		next;
	}
	print C1 $conds[$c],"\n";
}

close C1;


sub inList {
	my @tmpo = @_;
	my $checkCond = $tmpo[0];
	my $inCond = $tmpo[1];
	my $ret = "false";
	foreach my $c (@{map_match{$inCond}}){
		if($c eq $checkCond){
			$ret = "true";
		}
	}
	return $ret;
}
