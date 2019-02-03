## Actually output some overlapping peaks
## Only doing this for "corners" of stats table

seqcode_core_jar="/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/seqcode.mahonylab.jar"


a=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_ia_gt_in.peaks
b=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-48h_vs_iNgn2-48h_01302018/Ascl1-48hr_gt_Ngn2-48hr.peaks
a1=$(basename $a);
b1=$(basename $b);
x=${a1/.peaks/};
y=${b1/.peaks/};
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksA $a --peaksB $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$x"_overlaps_"$y".peaks"
grep -v -f $x"_overlaps_"$y".peaks" $a > $x"_nooverlap_"$y".peaks"
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksB $a --peaksA $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$y"_overlaps_"$x".peaks"
grep -v -f $y"_overlaps_"$x".peaks" $b > $y"_nooverlap_"$x".peaks"

a=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_ia_gt_in.peaks
b=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_01302018/Ascl1-12hr_gt_Ngn2-12hr.peaks
a1=$(basename $a);
b1=$(basename $b);
x=${a1/.peaks/};
y=${b1/.peaks/};
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksA $a --peaksB $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$x"_overlaps_"$y".peaks"
grep -v -f $x"_overlaps_"$y".peaks" $a > $x"_nooverlap_"$y".peaks"
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksB $a --peaksA $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$y"_overlaps_"$x".peaks"
grep -v -f $y"_overlaps_"$x".peaks" $b > $y"_nooverlap_"$x".peaks"

a=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_in_gt_ia.peaks
b=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-48h_vs_iNgn2-48h_01302018/Ngn2-48hr_gt_Ascl1-48hr.peaks
a1=$(basename $a);
b1=$(basename $b);
x=${a1/.peaks/};
y=${b1/.peaks/};
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksA $a --peaksB $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$x"_overlaps_"$y".peaks"
grep -v -f $x"_overlaps_"$y".peaks" $a > $x"_nooverlap_"$y".peaks"
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksB $a --peaksA $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$y"_overlaps_"$x".peaks"
grep -v -f $y"_overlaps_"$x".peaks" $b > $y"_nooverlap_"$x".peaks"

a=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/Brn2-iA_vs_Brn2-iN_01292018/Brn2_in_gt_ia.peaks
b=/gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/diffTFs/iAscl1-12h_vs_iNgn2-12h_01302018/Ngn2-12hr_gt_Ascl1-12hr.peaks
a1=$(basename $a);
b1=$(basename $b);
x=${a1/.peaks/};
y=${b1/.peaks/};
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksA $a --peaksB $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1>$x"_overlaps_"$y".peaks"
grep -v -f $x"_overlaps_"$y".peaks" $a > $x"_nooverlap_"$y".peaks"
java -Xmx5G org.seqcode.tools.location.PeaksVsPeaks --species "Mus musculus;mm10" --peaksB $a --peaksA $b --overlapdist 200 --peaksoverlap |grep -v "-" |cut -f1 >$y"_overlaps_"$x".peaks"
grep -v -f $y"_overlaps_"$x".peaks" $b > $y"_nooverlap_"$x".peaks"
