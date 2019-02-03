use strict;


my $file = $ARGV[0];

open(F1,$file);

# chr11:55634062-55634067:+
while(<F1>){
	my @pieces = split("\t",$_);
	if($pieces[0] =~ /^(chr\d+):(\d+)-(\d+):([+,-])/){
		if($4 eq "+"){
			print $1.":".$2,"\n";
		}else{
			print $1.":".$3,"\n";
		}
	}		
}
