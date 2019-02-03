#!/usr/bin/perl

my $myFile = $ARGV[0];
my $col = $ARGV[1];
my $threshold=0;
if($#ARGV>=2){
    $threshold=$ARGV[2];
}
$greater=1;
if($#ARGV>=3){
    $greater=$ARGV[3];
}
$absolute=1;
if($#ARGV>=4){
    $absolute=$ARGV[4];
}

unless(open(FILE, $myFile)){
	die "Cannot open file\n";}
while($curr=<FILE>){
    @currLine = split(/\s+/, $curr);
    $val =$currLine[$col];
    if($val ne "NA"){
	if($absolute==1){$val=abs($val);}

	if(($greater==1 && $val>=$threshold) || ($greater==0 && $val<=$threshold)){
	    print "$curr";
	}
    }
}

close(FILE);
