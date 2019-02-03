#PBS -W umask=0007
#PBS -W group_list=sam77_collab
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -A sam77_b_g_sc_default
#PBS -l mem=40gb

module load r/3.4
module load python/2.7.8

cd /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/overlap/Onecut2_vs_acc_meta_01312018

while read peaks; do
    peakbase=$(basename $peaks);
    outtmp=${peakbase/.events/_5kb.metaprofile};
    out=${outtmp/.peaks/_5kb.metaprofile};
java -cp /gpfs/group/sam77/default/projects/es/iAscl1_iNgn2/utils/seqcodedev.mahonylab.jar org.seqcode.lab.akshay.utils.MakeMetageneProfile --species "Mus musculus;mm10" --seq ~/group/genomes/mm10/ --win 5000 --bins 500 --rext 100 --peaks "$peaks" --design design.tab > $out
    sed -i 's/\#offset/offset/g' *metaprofile
done < events.list
