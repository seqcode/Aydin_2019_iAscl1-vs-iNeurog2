#!/usr/bin/perl
##Numerically sort on a particular column
my $col = $ARGV[0];
my $skipRows = 0;
my $increasing=0;
if($#ARGV>1){$skipRows = $ARGV[1];} 
if($#ARGV>2){$increasing = $ARGV[2];} 

$count=-$skipRows;
@data=();
$maxCol = 0;
while($curr=<STDIN>){
    chomp($curr);
    if($count>=0){
	@currLine = split(/\s+/, $curr);
	for($x=0; $x<=$#currLine; $x++){
	    $data[$count][$x] =$currLine[$x];
	}
	if($#currLine > $maxCol){$maxCol = $#currLine;}
    }$count++;
}
if($increasing==0){
    @sorted = sort { $b->[$col] <=> $a->[$col] } @data;
}else{
    @sorted = sort { $a->[$col] <=> $b->[$col] } @data;
}
for($i=0; $i<=$#sorted; $i++){
    for($j=0; $j<=$maxCol; $j++){
	print "$sorted[$i][$j]\t";
    }print "\n";
}
close(FILE);
