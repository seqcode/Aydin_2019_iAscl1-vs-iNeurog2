
##This script makes feature vector files required by the random forest classifier
##The feature vectors (and scripts) live here: ~/group/projects/es/windowed_es_features
##When generating new data over there, it would also be good to append your script call below 
##to group/projects/es/windowed_es_features/generate_counts_enrichment_commands_log

cd ~/group/projects/es/windowed_es_features

#EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment
perl misc_scripts/batchData_enrichment_single.pl ~/group/projects/es/windowed_es_features/mouse.eb.atacseq.groups_matched_ctrls	EB_5HMs_plus_ATACSeq_features_Onecut2_26012018_500bp_enrichment ~/group/projects/es/iAscl1_iNgn2/multigps_calls/Onecut2_26012018/Onecut2_26012018_multigps/Onecut2_26012018_multigps.all.events.table

cd -
