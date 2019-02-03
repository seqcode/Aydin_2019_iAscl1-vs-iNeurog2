

echo "EB H3K27ac"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB H3K27ac Ainv15(iNgn2.Isl1.Lhx3.V5);bowtie_unique" --peaks ~/group/projects/es/eb_active_regions/EB_Mazzoni_H3K27ac_Domains/EB_Mazzoni_H3K27ac_Domains_H3K27ac_EB.p0.01.domains
echo "iA+48hr H3K27ac"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+48hrDox(iAscl1.V5) H3K27ac Ainv15(iAscl1.V5);bowtie_unique" --peaks domains/domains_K27ac_iA_48hr.p0.05.domains
echo "iN+48hr H3K27ac"
java -cp ~/group/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "Mazzoni EB+48hrDox(iFlag.Ngn2) H3K27ac Ainv15(iFlag.Ngn2);bowtie_unique" --peaks domains/domains_K27ac_iN_48hr.p0.05.domains


