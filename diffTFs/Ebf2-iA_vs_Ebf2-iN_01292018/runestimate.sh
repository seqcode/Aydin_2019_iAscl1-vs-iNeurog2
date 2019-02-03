readdb_A="Mazzoni EB+48hrDox(iAscl1.V5) Ebf2 Ainv15(iAscl1.V5);bowtie_unique"
readdb_N="Mazzoni EB+48hrDox(iFlag.Ngn2) Ebf2 Ainv15(iFlag.Ngn2);bowtie_unique"

echo "Ebf2 iAscl1"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_A" --peaks Ebf2_peaks.ordered
echo "Ebf2 iNgn2"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_N" --peaks Ebf2_peaks.ordered

