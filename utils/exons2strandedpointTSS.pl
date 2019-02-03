#!/usr/bin/perl

#Mostly meant for the exon list that comes out of the inbuilt annotaton in Rsubread (incl.. featureCounts)
my $exonFile = $ARGV[0]; #exon list
my $id2gFile = $ARGV[1]; #id 2 gene name list
unless(open(EXONS, $exonFile)){
	die "Cannot open exon file\n";}
@linesExons = <EXONS>;
unless(open(ID2G, $id2gFile)){
	die "Cannot open ID 2 name file\n";}
@linesID2G = <ID2G>;

my %id2name=();
for($x=1; $x<=$#linesID2G; $x++){
    chomp($linesID2G[$x]);
    @curr = split(/\t/, $linesID2G[$x]);
    $id2name{$curr[1]}=$curr[2];
}

my %TSS=();
for($x=1; $x<=$#linesExons; $x++){
    chomp($linesExons[$x]);
    @curr = split(/\t/, $linesExons[$x]);

    $id = $curr[0];
    $chr = $curr[1]; 
    $start = $curr[2];
    $end = $curr[3];
    $strand = $curr[4];

    if(defined($TSS{$id})){
	$currStart = $TSS{$id}[1];
	if($strand eq "+" && $start<$currStart){
	    $TSS{$id}[1] = $start;
	}elsif($strand eq "-" && $end>$currStart){
	    $TSS{$id}[1] = $end;
	}
    }else{
	$TSS{$id}[0] = $chr;
	if($strand eq "+"){
	    $TSS{$id}[1] = $start;
	}else{
	    $TSS{$id}[1] = $end;
	}
	$TSS{$id}[2] = $strand;
    }
}
close(EXONS);
close(ID2G);

print "geneID\tgeneName\tTSS\n";
foreach my $id (keys %TSS) {
    $gene = "UNDEFINED";
    if(defined($id2name{$id})){
	$gene = $id2name{$id};
    }
    $coord = $TSS{$id}[0].":".$TSS{$id}[1].":".$TSS{$id}[2];
    print "$id\t$gene\t$coord\n";
}
