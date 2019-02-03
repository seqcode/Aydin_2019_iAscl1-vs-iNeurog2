#!/usr/bin/perl

my $myFile = $ARGV[0];
unless(open(FILE, $myFile)){
	die "Cannot open file\n";}

my @table = ();
my %gene2id = ();
my %rep2id = ();
my $numG=0;
my $numR=0;
my @geneNames=();
my @repNames=();
while($currLine=<FILE>){
    @curr = split(/\t/, $currLine);
    if($curr[0] ne "geneid"){
	$gene = $curr[0];
	$rep = $curr[1];
	$val = $curr[2];

	if(defined($gene2id{$gene})){
	    $gid = $gene2id{$gene};
	}else{
	    $gid = $numG;
	    $gene2id{$gene}=$gid;
	    $geneNames{$gid} = $gene;
	    $numG++;
	}

	if(defined($rep2id{$rep})){
	    $rid = $rep2id{$rep};
	}else{
	    $rid = $numR;
	    $rep2id{$rep}=$rid;
	    $repNames{$rid} = $rep;
#	    print "$rep\t$rid\t$repNames{$rid}\n";
	    $numR++;
	}

	$table[$gid][$rid]=$val;

    }
}

print "geneid";
for($r=0; $r<$numR; $r++){
    print "\t$repNames{$r}";
}
print "\n";
for($g=0; $g<$numG; $g++){
    print "$geneNames{$g}";
    for($r=0; $r<$numR; $r++){
	print "\t$table[$g][$r]";
    }
    print "\n";
}


close(FILE);
