# get all domains with a q-value cut-off of 0.05
# eb domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ascl1_peaksAtdomains/ascl1_peaksAtdomains_eb.p0.05.peaks | head -100000 > 0h_domains.list
# iascl1 12h and 48h domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ascl1_peaksAtdomains/ascl1_peaksAtdomains_ia12h.p0.05.peaks | head -100000 > ia12h_domains.list
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ascl1_peaksAtdomains/ascl1_peaksAtdomains_ia48h.p0.05.peaks > ia48h_domains.list

# ingn2 12h and 48h domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ngn2_and_chimera_peaksAtdomains/ngn2_and_chimera_peaksAtdomains_in12h.p0.05.peaks | head -100000 > in12h_domains.list
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ngn2_and_chimera_peaksAtdomains/ngn2_and_chimera_peaksAtdomains_in48h.p0.05.peaks | head -100000 > in48h_domains.list

# iascl1[ngn2;bhlh[ 12h and 48h domains
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ngn2_and_chimera_peaksAtdomains/ngn2_and_chimera_peaksAtdomains_ian12h.p0.05.peaks | head -100000 > ian12h_domains.list
awk '$5<0.01{print $1}' ~/group/projects/es/iAscl1_iNgn2/domain_calls/ATACseq_domains/ngn2_and_chimera_peaksAtdomains/ngn2_and_chimera_peaksAtdomains_ian48h.p0.05.peaks | head -100000 > ian48h_domains.list 


for i in *list; do java org.seqcode.lab.akshay.utils.FilterFeatures --species "Mus musculus;mm10" --seq ~/group/genomes/mm10 --peaks $i  --exclude ~/group/genomes/mm10/annotation/mm10-blacklist_ENCODE.regions > tmp; mv tmp $i; done

# all vs 0h
while read p; do java -Xmx20G org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --overlapD 200 --peaksA 0h_domains.list --peaksB $p > tmp; cond=$(echo -e "$p" | cut -d "_" -f1); grep -v "-" tmp | cut -f1 >> "$cond"_0h_union.peaks; grep "-" tmp | cut -f1 >> "$cond"_0h_union.peaks; java -Xmx20G org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --overlapD 200 --peaksB 0h_domains.list --peaksA $p > tmp; grep "-" tmp | cut -f1 >> "$cond"_0h_union.peaks; done < list1

# all 12h vs ia12h

while read p; do java -Xmx20G org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --overlapD 200 --peaksA ia12h_domains.list --peaksB $p > tmp; cond=$(echo -e "$p" | cut -d "_" -f1); grep -v "-" tmp | cut -f1 >> "$cond"_ia12h_union.peaks; grep "-" tmp | cut -f1 >> "$cond"_ia12h_union.peaks; java -Xmx20G org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --overlapD 200 --peaksB ia12h_domains.list --peaksA $p > tmp; grep "-" tmp | cut -f1 >> "$cond"_ia12h_union.peaks; done < list2

# all 48h vs ia48h

while read p; do java -Xmx20G org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --overlapD 200 --peaksA ia48h_domains.list --peaksB $p > tmp; cond=$(echo -e "$p" | cut -d "_" -f1); grep -v "-" tmp | cut -f1 >> "$cond"_ia48h_union.peaks; grep "-" tmp | cut -f1 >> "$cond"_ia48h_union.peaks; java -Xmx20G org.seqcode.lab.akshay.utils.PeaksVsPeaks --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --overlapD 200 --peaksB ia48h_domains.list --peaksA $p > tmp; grep "-" tmp | cut -f1 >> "$cond"_ia48h_union.peaks; done < list3

