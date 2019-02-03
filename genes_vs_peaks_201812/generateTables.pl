#!/usr/bin/perl
use Math::Complex;

## Makes separate matrices for:
##   TotalSites OverlapSitesPercentage TotalGenes OverlapGenesPercentage P-val
##   RandomOverlapSitesMeanPercentage RandomOverlapSitesStdDev
##   RandomOverlapGenesMeanPercentage RandomOverlapGenesStdDev
##   OverlapSitesOverRep
##   OverlapGenesOverRep

my $obsFile = $ARGV[0]; #result of run.sh
my $randFile = $ARGV[1]; #result of run_random.sh

unless(open(OBSFILE, $obsFile)){
    die "Cannot open obs file\n";}
@linesObs = <OBSFILE>;
unless(open(RANDFILE, $randFile)){
    die "Cannot open random file\n";}
@linesRand = <RANDFILE>;

my $numSites=0;
my $numGenes=0;
my @siteLabels=();
my @geneLabels=();
my %site2id=();
my %gene2id=();
my @totalSites=();
my @overlapSites=(); 
my @totalGenes=(); 
my @overlapGenes=();
my @pvals=();

#Construct index lookups
for($x=1; $x<=$#linesObs; $x++){
    chomp($linesObs[$x]);
    @curr = split(/\t/, $linesObs[$x]);

    $site = $curr[0];
    $gene = $curr[1];
    if(defined($site2id{$site})){
	$siteid = $site2id{$site};
    }else{
	$siteid=$numSites;
	$site2id{$site}=$siteid;
	$siteLabels[$siteid]=$site;
	$numSites++;
    }
    if(defined($gene2id{$gene})){
	$geneid = $gene2id{$gene};
    }else{
	$geneid=$numGenes;
	$gene2id{$gene}=$geneid;
	$geneLabels[$geneid]=$gene;
	$numGenes++;
    }
}

#Load matrices
for($x=1; $x<=$#linesObs; $x++){
    chomp($linesObs[$x]);
    @curr = split(/\t/, $linesObs[$x]);

    $site = $curr[0];
    $gene = $curr[1];
    $siteid=$site2id{$site};
    $geneid=$gene2id{$gene};
    
    $totalSites[$siteid][$geneid]=$curr[2];
    $overlapSites[$siteid][$geneid]=$curr[3];
    $totalGenes[$siteid][$geneid]=$curr[4];
    $overlapGenes[$siteid][$geneid]=$curr[5];
    $pvals[$siteid][$geneid]=$curr[6];
}

#Load random counts & process
my @sumRandSites=();
my @countRandSites=();
my @meanRandSites=();
my @sqdfRandSites=();
my @stddevRandSites=();
my @sumRandGenes=();
my @countRandGenes=();
my @meanRandGenes=();
my @sqdfRandGenes=();
my @stddevRandGenes=();
for($x=1; $x<=$#linesRand; $x++){
    chomp($linesRand[$x]);
    @curr = split(/\t/, $linesRand[$x]);
    @currB = split(/\:/, $curr[0]);

    $site = $currB[0];
    $gene = $curr[1];
    $siteid=$site2id{$site};
    $geneid=$gene2id{$gene};
    
    $sumRandSites[$siteid][$geneid]+=$curr[3];
    $sumRandGenes[$siteid][$geneid]+=$curr[5];
    $countRandSites[$siteid][$geneid]++;
    $countRandGenes[$siteid][$geneid]++;
}
#mean random overlaps
for($j=0; $j<$numSites; $j++){
    for($i=0; $i<$numGenes; $i++){ 
	$meanRandSites[$j][$i] = $sumRandSites[$j][$i]/$countRandSites[$j][$i];
	$meanRandGenes[$j][$i] = $sumRandGenes[$j][$i]/$countRandGenes[$j][$i];
    }
}
#Std. Dev
for($x=1; $x<=$#linesRand; $x++){
    chomp($linesRand[$x]);
    @curr = split(/\t/, $linesRand[$x]);
    @currB = split(/\:/, $curr[0]);

    $site = $currB[0];
    $gene = $curr[1];
    $siteid=$site2id{$site};
    $geneid=$gene2id{$gene};
    
    $sqdfRandSites[$siteid][$geneid]+=($meanRandSites[$siteid][$geneid]-$curr[3])*($meanRandSites[$siteid][$geneid]-$curr[3]);
    $sqdfRandGenes[$siteid][$geneid]+=($meanRandGenes[$siteid][$geneid]-$curr[5])*($meanRandGenes[$siteid][$geneid]-$curr[5]);
}
for($j=0; $j<$numSites; $j++){
    for($i=0; $i<$numGenes; $i++){
        $stddevRandSites[$j][$i] = sqrt($sqdfRandSites[$j][$i]/$countRandSites[$j][$i]);
        $stddevRandGenes[$j][$i] = sqrt($sqdfRandGenes[$j][$i]/$countRandGenes[$j][$i]);
    }
}


##################
#Print matrices

print "TotalSites";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ print "\t$totalSites[$j][$i]";}
    print "\n";
}
print "\n";

print "OverlappingSitesFraction";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $perc = $overlapSites[$j][$i]/$totalSites[$j][$i];  printf("\t%.4f", $perc);}
    print "\n";
}
print "\n";

print "TotalGenes";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ print "\t$totalGenes[$j][$i]";}
    print "\n";
}
print "\n";

print "OverlappingGenesFraction";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $perc = $overlapGenes[$j][$i]/$totalGenes[$j][$i];  printf("\t%.4f", $perc);}
    print "\n";
}
print "\n";

print "P-values";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ print "\t$pvals[$j][$i]";}
    print "\n";
}
print "\n";

print "RandomOverlappingSitesFraction";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $perc = $meanRandSites[$j][$i]/$totalSites[$j][$i];  printf("\t%.4f", $perc);}
    print "\n";
}
print "\n";

print "RandomOverlappingSitesStdDev";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $perc = $stddevRandSites[$j][$i]/$totalSites[$j][$i];  printf("\t%.4f", $perc);}
    print "\n";
}
print "\n";

print "RandomOverlappingGenesFraction";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $perc = $meanRandGenes[$j][$i]/$totalGenes[$j][$i];  printf("\t%.4f", $perc);}
    print "\n";
}
print "\n";

print "RandomOverlappingGenesStdDev";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $perc = $stddevRandGenes[$j][$i]/$totalSites[$j][$i];  printf("\t%.4f", $perc);}
    print "\n";
}
print "\n";

print "OverlappingSitesOverrep";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $over = $overlapSites[$j][$i]/$meanRandSites[$j][$i];  printf("\t%.4f", $over);}
    print "\n";
}
print "\n";

print "OverlappingGenesOverrep";
for($i=0; $i<$numGenes; $i++){ print "\t$geneLabels[$i]";}
print "\n";
for($j=0; $j<$numSites; $j++){
    print "$siteLabels[$j]";
    for($i=0; $i<$numGenes; $i++){ $over = $overlapGenes[$j][$i]/$meanRandGenes[$j][$i];  printf("\t%.4f", $over);}
    print "\n";
}
print "\n";


close(OBSFILE);
close(RANDFILE);
