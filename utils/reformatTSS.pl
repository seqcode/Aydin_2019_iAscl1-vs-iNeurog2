#!/usr/bin/perl

my $inFile = $ARGV[0];
unless (open(TSS, $inFile)) {
   die "Cannot open file: $!"; }
@lines = <TSS>;

for($i=1; $i<=$#lines; $i++){
    chomp($lines[$i]);
    @curr = split(/\t/, $lines[$i]);

    $id = $curr[0];
    $name = $curr[1];
    $coords = $curr[2];
    @currB = split(/\:/, $coords);
    $chr = $currB[0];
    $start = $currB[1];
    $strand = $currB[2];

    print "$chr\t$start\t$strand\t$id\n";
}
close(TSS);
