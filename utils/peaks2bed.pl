#!/usr/bin/perl

#Split regions into overlapping windows
my $file1 = $ARGV[0];
$win=100;
if($#ARGV>0){
    $win=$ARGV[1];
}

unless(open(F1, $file1)){
	die "Cannot open peaks file\n";}
@linesRegA = <F1>;

for($i=0; $i<=$#linesRegA; $i++){
	@curr = split(/\s+/, $linesRegA[$i]);
	if($curr[0] !~ m/^Region/ && $curr[0] !~ m/^#/ && $curr[0] !~ m/Position/){
	if($curr[0] =~ m/\:/){
		@curr2 = split(/\:/, $curr[0]);
		$chr = $curr2[0]; $chr =~ s/chr//g;
		@curr3 = split(/\-/, $curr2[1]);
		if($#curr3>=1){
		    $start = $curr3[0];
		    $stop = $curr3[1];
		}else{
		    $start=$curr3[0];		    
		    $stop=$curr3[0]+1;
		}
	}else{
		$chr = $curr[0];
		$start = $curr[1];
		$stop = $curr[2];
	}
	$start = $start-int(($win/2));
	$stop  = $stop+int(($win/2))+1;
	$score = int($curr[1]);
	print "chr$chr\t$start\t$stop\tPEAK\t$score\t+\n";
	}
}
