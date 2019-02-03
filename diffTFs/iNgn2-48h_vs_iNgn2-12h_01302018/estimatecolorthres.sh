readdbA="Mazzoni EB+48hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique"
readdbN="Mazzoni EB+12hrDox(iFlag.Ngn2) Ngn2 Ainv15(iFlag.Ngn2);bowtie_unique"


for i in *ordered; do
	echo "$i"" vs ""$readdbA"
	java -Xmx10G -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdbA" --peaks $i

	echo "$i"" vs ""$readdbN"
	java -Xmx10G -cp ../seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MetaplotLinemaxEstimator --species "Mus musculus;mm10" --win 1000 --bins 500 --readext 100 --rdbexpt "$readdbN" --peaks $i

done
