#!/usr/bin/perl

#Split regions into overlapping windows
my $file1 = $ARGV[0];
my $win = 500; 
if($#ARGV>0){
    $win = $ARGV[1];
}
unless(open(F1, $file1)){
	die "Cannot open peaks file\n";}
@linesRegA = <F1>;
$startPos = 0;
if($linesRegA[0] =~ m/Region/){
    $startPos=1;
    print $linesRegA[0];
}
for($i=$startPos; $i<=$#linesRegA; $i++){
    if($linesRegA[$i] !~ m/^#/){
	@curr = split(/\s+/, $linesRegA[$i]);
	$strand="";
	if($curr[0] =~ m/\:/){
		@curr2 = split(/\:/, $curr[0]);
		$chr = $curr2[0]; $chr =~ s/chr//g;
		@curr3 = split(/\-/, $curr2[1]);
		if($#curr3>=1){
		    $start = $curr3[0];
		    $stop = $curr3[1];
		}else{
		    $start=$curr2[1]-$win/2;		    
		    $stop=$curr2[1]+($win/2)-1;
		}
		if($#curr2>1){
		    $strand = $curr2[2];
		}
	}else{
		$chr = $curr[0]; $chr =~ s/chr//g;
		$start = $curr[1];
		$stop = $curr[2];
	}

	print "chr$chr\t$start\t$stop\tREGION\t1\t+\n";
    }
}
