readdb_A="Mazzoni EB+48hrDox(iAscl1.V5) Onecut2 Ainv15(iAscl1.V5);bowtie_unique"
readdb_N="Mazzoni EB+48hrDox(iFlag.Ngn2) Onecut2 Ainv15(iFlag.Ngn2);bowtie_unique"


echo "Onecut2 iAscl1"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_A" --peaks Onecut2_peaks.ordered 
echo "Onecut2 iNgn2"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_N" --peaks Onecut2_peaks.ordered 

