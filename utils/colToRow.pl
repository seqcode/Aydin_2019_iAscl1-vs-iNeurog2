use strict;

my $file = $ARGV[0];

open(F1,$file);

while(<F1>){
	chomp $_;
	my @line = split("\t",$_);
	print $line[0],"\t";
}

close(F1);
