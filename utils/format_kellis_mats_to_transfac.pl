use strict;


open(I1,$ARGV[0]);

my $count= 0;
while(<I1>){
	chomp $_;
	if(/^>/){
		my @head = split('\s|\t',$_);
		$head[0] =~ s/^>//g;
		print "XX","\n";
		print "DE","\t",$head[0],"\n";
		$count = 0;
	}
	else{
		my @pieces = split('\s',$_);
		print $count,"\t",$pieces[1],"\t",$pieces[2],"\t",$pieces[3],"\t",$pieces[4],"\t",$pieces[0],"\n";
		$count++;
		
	}

}
