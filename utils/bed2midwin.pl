#!/usr/bin/perl
use POSIX;
$inName = $ARGV[0];
$win = 500; 
if($#ARGV>0){
    $win = $ARGV[1];
}
$showstrand=0;

unless (open(IN, $inName)) {
    die "Cannot open file: $!"; }

while($currLine = <IN>){
    @curr = split(/\s+/, $currLine);
    $start = $curr[1]+1; #BED is 0-based
    $end = $curr[2]; #BED is 0-based and end-exclusive
    $mid = floor(($start+$end)/2);
    $newstart = $mid-($win/2);
    $newend = $mid+($win/2)-1;

    $strand='.';
    if($#curr>=5){
	$strand = $curr[5];
    }

    if($showstrand==1 && ($strand eq '+' || $strand eq '-')){
	print "$curr[0]:$newstart-$newend:$strand\n";
    }else{
	print "$curr[0]:$newstart-$newend\n";
    }
}




