
#             - Find N > A that overlap with accessible domains in iA 48hrs and EB (as a control)
#             - Find A > N that overlap with accessible domains in iN 48hrs and EB (as a control)

cd ~/group/projects/es/iAscl1_iNgn2/overlap/Ascl1_vs_Ngn2_12h_vs_acc_10132018
#get the peaks
cp  ../../chromatin/activity_classes/iAscl1-12hr_iNgn2-12hr_EB-activity-classes/*gt*inTop10k_Inactive_probGtePt8.peaks .
for i in *peaks; do perl ../../utils/peaks2bed.pl $i 100 >${i/peaks/win100.bed}; done
#get the overlaps
bedtools intersect -wa -a Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_eb.p0.05.bed >Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.overlap-EB-acc.win100.bed
bedtools intersect -wa -a Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_ia12h.p0.05.bed >Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.overlap-iA12h-acc.win100.bed 
bedtools intersect -wa -a Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_ia48h.p0.05.bed >Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.overlap-iA48h-acc.win100.bed 
bedtools intersect -wa -a Ascl1-12hr_gt_Ngn2-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_eb.p0.05.bed >Ascl1-12hr_gt_Ngn2-12hr_inTop10k_Inactive_probGtePt8.overlap-EB-acc.win100.bed
bedtools intersect -wa -a Ascl1-12hr_gt_Ngn2-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ngn2_and_chimera_domains/ngn2_and_chimera_domains_in12h.p0.05.bed >Ascl1-12hr_gt_Ngn2-12hr_inTop10k_Inactive_probGtePt8.overlap-iN12h-acc.win100.bed
bedtools intersect -wa -a Ascl1-12hr_gt_Ngn2-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ngn2_and_chimera_domains/ngn2_and_chimera_domains_in48h.p0.05.bed >Ascl1-12hr_gt_Ngn2-12hr_inTop10k_Inactive_probGtePt8.overlap-iN48h-acc.win100.bed
#get the no overlaps
bedtools intersect -v -wa -a Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_eb.p0.05.bed >Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.nooverlap-EB-acc.win100.bed
bedtools intersect -v -wa -a Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_ia12h.p0.05.bed >Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.nooverlap-iA12h-acc.win100.bed 
bedtools intersect -v -wa -a Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.win100.bed -b ../../domain_calls/ATACseq_domains/ascl1_domains/ascl1_domains_ia48h.p0.05.bed >Ngn2-12hr_gt_Ascl1-12hr_inTop10k_Inactive_probGtePt8.nooverlap-iA48h-acc.win100.bed

