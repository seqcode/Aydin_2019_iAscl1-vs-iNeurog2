#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load python

cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/iBrn2_vs_iA_iN_11132018

#### Please provide these parameters before running
## The overlap stats will be save in the file named "overlap.stats"
### This is a file with locations of all Ascl1 and Ngn2 binding classes
a_and_n_peaks_list="a_and_n_peaks.list"
#### This is a file with locations of all binding classes for some other TF
other_peaks_list="brn2_peaks.list"
tf_name="Brn2"
seqcode_core_jar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/seqcode.mahonylab.jar"


######################
echo -e "Peak counts:" >overlap.stats
while read a; do
  	x=$(basename $a)
	count=$(grep -v "#" $a | wc -l)
        echo -e $x"\t"$count >> overlap.stats
done < $a_and_n_peaks_list
while read a; do
  	x=$(basename $a)
	count=$(grep -v "#" $a | wc -l)
        echo -e $x"\t"$count >> overlap.stats
done < $other_peaks_list

echo -e "PeaksAFile\tPeaksBFile\tPeaksATotal\tPeaksAOverlapB\tPeaksAOverlapBRate\tNegTotal\tNegOverlapB\tNegOverlapBRate\tPeaksAOverlapBOverRep" >>overlap.stats
while read a; do
	while read b; do
		x=$(basename $a)
		y=$(basename $b)
		overlap=$(java -Xmx5G -cp $seqcode_core_jar org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksA $a --peaksB $b --overlapdist 200 --neg random --numrand 100000 --overlapstats | grep -v "PeaksATotal")
		echo -e $x"\t"$y"\t"$overlap >> overlap.stats
	done < $a_and_n_peaks_list
done < $other_peaks_list

