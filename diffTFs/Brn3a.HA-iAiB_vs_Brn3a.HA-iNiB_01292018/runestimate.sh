readdb_A="Mazzoni EB+24hrDox(iAscl1.V5.TRE.Brn3a.HA) Brn3a.HA Ainv15(iAscl1.V5.TRE.Brn3a.HA);bowtie_unique"
readdb_N="Mazzoni EB+24hrDox(iNgn2.TRE.Brn3a.HA) Brn3a.HA Ainv15(iNgn2.TRE.Brn3a.HA);bowtie_unique"

# iAscl1
echo "Brn3a iAscl1_peaks"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_A" --peaks Brn3a_peaks.ordered
# iNgn2
echo "Brn3a iNgn2_peaks"
java -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdb_N" --peaks Brn3a_peaks.ordered

