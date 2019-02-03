#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=20gb

##NB: run makeFeatureVectors.sh before this script!
## Also, this file needs to contain a list of the peak files to be classified
peakslist="peaks.list"

cd ~/group/projects/es/iAscl1_iNgn2/chromatin/activity_classes/Onecut2-iA_Onecut2-iN_EB-activity-classes


#This uses classifiers based on ~/group/projects/es/windowed_es_features/EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment 
sh ~/group/projects/es/windowed_es_features/generate_arff.sh EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment 
sed -i "s/'?'/Active,Inactive/g" *.arff

java -Xmx18G org.seqcode.ml.classification.WekaRandomForest -T EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment.arff -l ~/group/projects/es/eb-region-classifiers/Active_vs_Unmarked_EB_5HMs_ATACSeq_features/Active_vs_Unmarked_RandomForest_11_07_2016.mod  -p 0 > tmp

perl ~/group/projects/es/iAscl1_iNgn2/utils/process_ES_Active_Inactive_evaluation.pl EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment.order tmp > EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment.evaluation

## Probability threshold >0.8 used to define EB "active" sites
while read i; do

	j1=$(basename $i);
	j2=${j1/.events/};
	j=${j2/.peaks/};
	
	cut -f1 $i > tmp; 
	perl ~/group/projects/es/iAscl1_iNgn2/utils/cbind.pl EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment.evaluation tmp out 0 1 0; 
	#head out; 
	awk '$2>=0.8{print $0}' out  > "$j""_Active_probGtePt8.peaks"; 
	awk '$2<0.8{print $0}' out > "$j""_Inactive_probGtePt8.peaks"; 
	echo $j; 

done < $peakslist


