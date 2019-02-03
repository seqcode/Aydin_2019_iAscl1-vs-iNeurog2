use strict;

my $input_file = $ARGV[0];

open(I1,$input_file);

my @data=();

my $row_ind=0;
my $ncol=0;
while(<I1>){
	chomp $_;
	my @words = split("\t",$_);
	$ncol = $#words+1;
	for(my $c=0; $c<=$#words; $c++){
		$data[$row_ind][$c]=$words[$c];
	}
	$row_ind++;
}

for(my $c=0; $c<$ncol; $c++){
	for(my $r=0; $r<$row_ind; $r++){
		print $data[$r][$c],"\t";
	}
	print "\n";
}
