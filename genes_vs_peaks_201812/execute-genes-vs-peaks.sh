cd ~/group/projects/es/iAscl1_iNgn2/genes_vs_peaks_201812

#cp -R ../genes_vs_peaks/gene_sets_iA* .
mkdir gene_sets_iA-iN_vs_EB
mkdir gene_sets_iA-iN_vs_EB_venn
mkdir gene_sets_iA_vs_iN
cp  ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/*EB.list gene_sets_iA-iN_vs_EB/
cp  ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/*and*.list gene_sets_iA-iN_vs_EB_venn/
cp  ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/*only*.list gene_sets_iA-iN_vs_EB_venn/
cp  ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/*and*.list gene_sets_iA_vs_iN/
cp ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/i*gt*i*.list gene_sets_iA_vs_iN/
cp ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/t2g_mapping.tab .
cp ../rnaseq/iAscl1_iNgn2_EB_12_48_deseq2/mm10_RefSeq_exon.txt .
perl ../utils/exons2strandedpointTSS.pl mm10_RefSeq_exon.txt t2g_mapping.tab |grep -v "NT_" >mm10_refseq.tss.txt
perl ~/Tools/info2bed.pl ~/group/genomes/mm10/mm10.info >mm10.bed
#Format for GREAT
perl ../utils/reformatTSS.pl mm10_refseq.tss.txt >mm10_refseq.tss
~/group/software/greatTools/createRegulatoryDomains mm10_refseq.tss ~/group/genomes/mm10/mm10.info basalPlusExtension mm10_refseq.regdom -maxExtension=100000 -basalUpstream=5000 -basalDownstream=1000
 
#Format gene list categories
cd gene_sets_iA-iN
for i in *list; do j=${i/list/ids}; cut -f2 $i >$j; perl ../..//utils/grepColWithList.pl ../mm10_refseq.regdom $j 3 >${j/ids/regdom}; done
cd ../gene_sets_iA_vs_iN/
for i in *list; do j=${i/list/ids}; cut -f2 $i >$j; perl ../..//utils/grepColWithList.pl ../mm10_refseq.regdom $j 3 >${j/ids/regdom}; done
cd ../gene_sets_iA-iN_vs_EB
for i in *list; do perl ../..//utils/grepColWithList.pl ../mm10_refseq.regdom $i 3 >${i/list/regdom}; done
cd ../gene_sets_iA-iN_vs_EB_venn
for i in *list; do perl ../..//utils/grepColWithList.pl ../mm10_refseq.regdom $i 3 >${i/list/regdom}; done
cd ..

#Set up the necessary directories
mkdir genes-venn_vs_Ascl1-Ngn2-12h-diffs
cp bindingsites.Ascl1-Ngn2-12h-diffs.list genes-venn_vs_Ascl1-Ngn2-12h-diffs/bindingsites.list 
cp genesets-venn.list genes-venn_vs_Ascl1-Ngn2-12h-diffs/genesets.list
cd genes-venn_vs_Ascl1-Ngn2-12h-diffs
sh ../run.sh >genes-venn_vs_Ascl1-Ngn2-12h-diffs.txt
sh ../run_random.sh >genes-venn_vs_Ascl1-Ngn2-12h-diffs.randoms.txt
perl ../generateTables.pl genes-venn_vs_Ascl1-Ngn2-12h-diffs.txt genes-venn_vs_Ascl1-Ngn2-12h-diffs.randoms.txt >genes-venn_vs_Ascl1-Ngn2-12h-diffs.summary.tab.txt
cd ..
mkdir genes-venn_vs_Ascl1-Ngn2-48h-diffs
cp bindingsites.Ascl1-Ngn2-48h-diffs.list genes-venn_vs_Ascl1-Ngn2-48h-diffs/bindingsites.list 
cp genesets-venn.list genes-venn_vs_Ascl1-Ngn2-48h-diffs/genesets.list
cd genes-venn_vs_Ascl1-Ngn2-48h-diffs
sh ../run.sh >genes-venn_vs_Ascl1-Ngn2-48h-diffs.txt
sh ../run_random.sh >genes-venn_vs_Ascl1-Ngn2-48h-diffs.randoms.txt
perl ../generateTables.pl genes-venn_vs_Ascl1-Ngn2-48h-diffs.txt genes-venn_vs_Ascl1-Ngn2-48h-diffs.randoms.txt >genes-venn_vs_Ascl1-Ngn2-48h-diffs.summary.tab.txt
cd ..
mkdir genes-venn_vs_Brn2-iA-iN-diffs
cp bindingsites.Brn2-iA-iN-diffs.list genes-venn_vs_Brn2-iA-iN-diffs/bindingsites.list 
cp genesets-venn.list genes-venn_vs_Brn2-iA-iN-diffs/genesets.list
cd genes-venn_vs_Brn2-iA-iN-diffs
sh ../run.sh >genes-venn_vs_Brn2-iA-iN-diffs.txt
sh ../run_random.sh >genes-venn_vs_Brn2-iA-iN-diffs.randoms.txt
perl ../generateTables.pl genes-venn_vs_Brn2-iA-iN-diffs.txt genes-venn_vs_Brn2-iA-iN-diffs.randoms.txt >genes-venn_vs_Brn2-iA-iN-diffs.summary.tab.txt
cd ..
mkdir genes-venn_vs_Ebf2-iA-iN-diffs
cp bindingsites.Ebf2-iA-iN-diffs.list genes-venn_vs_Ebf2-iA-iN-diffs/bindingsites.list 
cp genesets-venn.list genes-venn_vs_Ebf2-iA-iN-diffs/genesets.list
cd genes-venn_vs_Ebf2-iA-iN-diffs
sh ../run.sh >genes-venn_vs_Ebf2-iA-iN-diffs.txt
sh ../run_random.sh >genes-venn_vs_Ebf2-iA-iN-diffs.randoms.txt
perl ../generateTables.pl genes-venn_vs_Ebf2-iA-iN-diffs.txt genes-venn_vs_Ebf2-iA-iN-diffs.randoms.txt >genes-venn_vs_Ebf2-iA-iN-diffs.summary.tab.txt
cd ..
mkdir genes-venn_vs_Onecut2-iA-iN-diffs
cp bindingsites.Onecut2-iA-iN-diffs.list genes-venn_vs_Onecut2-iA-iN-diffs/bindingsites.list 
cp genesets-venn.list genes-venn_vs_Onecut2-iA-iN-diffs/genesets.list
cd genes-venn_vs_Onecut2-iA-iN-diffs
sh ../run.sh >genes-venn_vs_Onecut2-iA-iN-diffs.txt
sh ../run_random.sh >genes-venn_vs_Onecut2-iA-iN-diffs.randoms.txt
perl ../generateTables.pl genes-venn_vs_Onecut2-iA-iN-diffs.txt genes-venn_vs_Onecut2-iA-iN-diffs.randoms.txt >genes-venn_vs_Onecut2-iA-iN-diffs.summary.tab.txt
cd ..