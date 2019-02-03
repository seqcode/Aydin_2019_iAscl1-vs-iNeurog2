#!/usr/bin/perl
##Split clusters based on labels in second column
my $myFile = $ARGV[0];
unless(open(FILE, $myFile)){
	die "Cannot open file\n";}


@data=();
%clusterCounts=();
while($currL=<FILE>){
    chomp($currL);
    @curr = split(/\s+/, $currL);
    $index = $curr[1];
    if(!defined($clusterCounts{$index})){
	$clusterCounts{$index}=0;
    }
    $data[$index][$clusterCounts{$index}] =$curr[0];
    $clusterCounts{$index}+=1;
}

foreach my $key (keys %clusterCounts) {
    $outFile=$myFile."_cluster".$key.".list";
    unless (open(OUT, ">$outFile")) {
        die "Cannot open file: $!"; }
    for($i=0; $i<$clusterCounts{$key}; $i++){
	print OUT "$data[$key][$i]\n";
	#print "$data[$key][$i]\n";
    }
    close OUT;
}

close FILE;
