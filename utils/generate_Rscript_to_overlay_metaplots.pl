use strict;



open(O1,">run.R");

my $count = 1;

my @cols = ("red","blue","black","green","pink");

my @labs=();

## Reading all the data using R's read.table

my $legend = "c(";
my $col_legend = "c(";

foreach my $profile (@ARGV){
	my @pieces = split(":",$profile);
	my $name = "dat".$count;
	push(@labs,$pieces[1]);
	$legend = $legend."\"$pieces[1]\",";
	$col_legend = $col_legend."\"$cols[$count-1]\",";
	$count++;
	print O1 $name," = read.table(\"$pieces[0]\")","\n";
}

my $buff = chop $legend;
$buff = chop $col_legend;

$legend = $legend.")";
$col_legend = $col_legend.")";



$count--;


## Finding the max in the entire dataset

my $max_string = "ymax = max(";
for(my $i=1; $i<=$count; $i++){
	$max_string = $max_string."dat".$i."[,2],";
}

print O1 "xmin=min(dat1[,1])","\n";

print O1 "xmax=max(dat1[,1])","\n";


$buff  = chop $max_string;

$max_string = $max_string.")";

print O1 $max_string,"\n";

print O1 "png(\"tmp.png\",width=700,height=700)","\n";

print O1 "plot(dat1[,1],dat1[,2], xaxt=\"n\",xlab=\"distance(bp)\", ylab=\"\", type=\"l\",yaxt=\"n\",lwd=4,ylim=c(0,ymax),col=\"".$cols[0]."\")","\n";

for(my $i=1; $i<=$#ARGV; $i++){
	my $j = $i+1;
	my $name = "dat"."$j";
	print O1 "lines(".$name."[,1],".$name."[,2],lwd=4,col=\"".$cols[$i]."\")","\n";

}
print O1 "legend(\"topright\",legend=".$legend.",col=".$col_legend.",lwd=2)","\n";


##

print O1 "axis(1,at=round(seq(xmin,xmax,(xmax-xmin)/4),0))","\n";

close(O1);
