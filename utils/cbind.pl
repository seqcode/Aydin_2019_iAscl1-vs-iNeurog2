use strict;


# Input files and description
#######################################################################################################################################################3
my $f1=$ARGV[0];                         # The input filename from which you want to take a column/columns 
my $f2=$ARGV[1];		         # The output filename where you want to append column/columns 
my $f3=$ARGV[2];		         # The file name to write the output
my $input_pivot_col_no=$ARGV[3];         # The column no in the input file which you want to take as keys(pivot).. the column no are 0,1,2,....
my $input_col_no_to_add=$ARGV[4];        # The columns numbers you want to select in the input file eg :- 1:2:3... if only one column then just 4
my $output_pivot_col_no=$ARGV[5];        # The column no in the output file which you want to take as keys(pivot).. the column no are 0,1,2,....
############################################################################################################################################################

################################################################################################################################################################
open (F1,$f1) or die $!;
open (F2,$f2) or die $!;
open (F3,">$f3");
my @input = <F1>;
my @output = <F2>;
chomp (@input);
chomp (@output);
################################################################################################################################################################3

my %input_hash;
foreach my $i (@input)
{
	my @line = split "\t",$i;
	my @colunums;
	if($input_col_no_to_add eq "all"){
		@colunums = (1..$#line);
		#print $colunums[2],"\n";
	}else{
		@colunums = split ":",$input_col_no_to_add;
	}
	my $string_to_be_added;
	foreach my $j (@colunums)
	{
		$string_to_be_added = $string_to_be_added.$line[$j]."\t";
	}
  	my $buff = chop $string_to_be_added;
	$input_hash{$line[$input_pivot_col_no]}=$string_to_be_added;
}

foreach my $i (@output)
{
	my @line = split "\t",$i;
	if (exists $input_hash{$line[$output_pivot_col_no]})
	{
		push (@line,$input_hash{$line[$output_pivot_col_no]});
	}
	else
	{
		my @columns = split ":",$input_col_no_to_add;
		foreach my $c (@columns){
			push (@line,"-");
		}
	}
	my $out = join("\t",@line); 
	print F3 $out,"\n";
}

