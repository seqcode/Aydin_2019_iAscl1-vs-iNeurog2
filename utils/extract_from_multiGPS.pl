## This perl script is meant to extract two kinds/types of features for a given subset of multiGPS binding event locations
# The first feature is the foldchange over input for a specified condition
# The second feature is the differential binding fold change between a given pair of conditions

# The script takes the following input parameters
# 1) The multiGPS all.events file
# 2) The subset of binding events 
# 3) The condition for which the binding strength is needed
# 4) The pair of conditions for which the differential binding is needed. (order maintained A;B will calculate A_vs_B)

my $all_events = $ARGV[0];
my $subset = $ARGV[1];
my $BS_cond_name = $ARGV[2];
my $BD_cond_names = $ARGV[3];
my $pvalue = $ARGV[4]; ## P-value:true; Foldchange:false; signal:sig 




my @conds; # Stores the condition names in the same order
my %pvales; # Stores all the fields of from multiGPS out

my $chr_at_begin = "true";

open(I1,$all_events);

while(<I1>){
	chomp $_;
	my @pieces = split("\t",$_);
	if(/^#Condition/){
		if($pieces[1] ne "Name"){
			push(@conds,join("_",@pieces[1]));
		}
	}elsif(!/^#/){
		if(!/^chr/){
			$chr_at_begin = "false";
		}
		$pvales{$pieces[0]} = [@pieces];	
	}

}

close(I1);

my $BScondInd = 0;
my $BDpairOneInd = 0;
my $BDpairTwoInd = 0;

my @BD = split(";",$BD_cond_names);


my $count=0;
foreach my $con (@conds){
	if($con eq $BS_cond_name){
		$BScondInd = $count+1;
	}
	if($con eq $BD[0]){
		$BDpairOneInd = $count+1;
	}
	$count++;
}

foreach my $con (@conds){
	if($con ne $BD[0]){
		$BDpairTwoInd++;
		if($con eq $BD[1]){
			last;
		}
	}
}

my @subsetBEs;

open(S1,$subset);
while(<S1>){
	chomp $_;
	my @pieces = split("\t",$_);
	if($chr_at_begin eq "false"){	
		$pieces[0] =~ s/^chr//;
	}else{
		if(!($pieces[0] =~ /^chr/)){
			$pieces[0] = "chr".$pieces[0];
		}
	}
	push(@subsetBEs,$pieces[0]);
}
close(S1);


my $foldchangeID = (4*$BScondInd)-1;
my $sigID = (4*$BScondInd)-3;
my $BSPvalueID = (4*$BScondInd); 
my $N = $#conds+1;
my $BDfoldchangeID = (4*($N)+1)+(3*($BDpairTwoInd)-1)+(3*($N-1)*($BDpairOneInd-1))-1;
my $BDPvalueID = (4*($N)+1)+(3*($BDpairTwoInd)-1)+(3*($N-1)*($BDpairOneInd-1));


foreach my $be (@subsetBEs){
	
	my $sig = $pvales{$be}->[$sigID];	
	my $foldchange = $pvales{$be}->[$foldchangeID];	
	my $BDfoldchange = $pvales{$be}->[$BDfoldchangeID];
	my $BSPvalue = $pvales{$be}->[$BSPvalueID];
	my $BDSignedPvalue = $pvales{$be}->[$BDPvalueID];
	if($BDfoldchange < 0){$BDSignedPvalue = -1*$BDSignedPvalue;}
	if($pvalue eq "false"){
		print $be,"\t",$foldchange,"\t",$BDfoldchange,"\n";
	}elsif($pvalue eq "sig"){
		print $be,"\t",$sig,"\t",$BDSignedPvalue,"\n";
	}else{
		print $be,"\t",$BSPvalue,"\t",$BDSignedPvalue,"\n";
	}
}




