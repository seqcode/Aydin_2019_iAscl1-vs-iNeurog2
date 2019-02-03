# iAscl1 
readdb_A="Mazzoni EB+48hrDox(iAscl1.V5) Brn2 Ainv15(iAscl1.V5);bowtie_unique"
# iNgn2
readdb_A_Wernig="Wernig MEF(+d2_lv.iAscl1.Brn2.Myt1l+Dox) Brn2 C57BL6;bowtie_unique"

# iAscl1
echo "Mazzoni iAscl1_peaks"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_A" --peaks A_peaks.ordered
# iNgn2
echo "Wernig Ascl1_peaks"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_A_Wernig" --peaks A_Wernig_peaks.ordered

