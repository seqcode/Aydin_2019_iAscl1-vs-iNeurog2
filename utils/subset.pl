use strict;

my $file1 = $ARGV[0];
my $file2 = $ARGV[1];
my $index1 = $ARGV[2];
my $index2 = $ARGV[3];
my $operation = $ARGV[4]; ## in or out 


open(F1,$file1);
open(F2,$file2);

my %contents1;
my %contents2;

while(<F1>){
	chomp $_;
	my @pieces = split("\t",$_);
	if(!exists $contents1{$pieces[$index1]}){
		$contents1{$pieces[$index1]} = $_;
	}
}
close(F1);

while(<F2>){
	chomp $_;
	my @pieces = split("\t",$_);
	if(!exists $contents2{$pieces[$index2]}){
		$contents2{$pieces[$index2]} = $_;
	}
}
close(F2);


if($operation eq "in"){
	foreach my $k (keys %contents2){
		if(exists $contents1{$k}){
			print $contents2{$k},"\n";
		}
	} 
}elsif($operation eq "out"){
	foreach my $k (keys %contents2){
		if(!exists $contents1{$k}){
			print $contents2{$k},"\n";
		}
	}
}

