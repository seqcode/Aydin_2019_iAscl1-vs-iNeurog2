

echo "EB ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Ohler EB ATACseq Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie2_unique" --peaks ascl1_domains/ascl1_domains_eb.p0.05.domains
echo "iA+12hr ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+12hrDox(iAscl1.V5) ATACseq Ainv15(iAscl1.V5);bowtie2_unique" --peaks ascl1_domains/ascl1_domains_ia12h.p0.05.domains
echo "iA482hr ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) ATACseq Ainv15(iAscl1.V5);bowtie2_unique" --peaks ascl1_domains/ascl1_domains_ia48h.p0.05.domains
echo "iN+12hr ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+12hrDox(iFlag.Ngn2) ATACseq Ainv15(iFlag.Ngn2);bowtie2_unique" --peaks ngn2_and_chimera_domains/ngn2_and_chimera_domains_in12h.p0.05.domains
echo "iN+48hr ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) ATACseq Ainv15(iFlag.Ngn2);bowtie2_unique" --peaks ngn2_and_chimera_domains/ngn2_and_chimera_domains_in48h.p0.05.domains
echo "iA[N]+12hr ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+12hrDox(iAscl1[bHLH:Ngn2].HA) ATACseq Ainv15(iAscl1[bHLH:Ngn2].HA);bowtie2_unique" --peaks ngn2_and_chimera_domains/ngn2_and_chimera_domains_ian12h.p0.05.domains
echo "iA[N]+48hr ATAC"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+48hrDox(iAscl1[bHLH:Ngn2].HA) ATACseq Ainv15(iAscl1[bHLH:Ngn2].HA);bowtie2_unique" --peaks ngn2_and_chimera_domains/ngn2_and_chimera_domains_ian48h.p0.05.domains

