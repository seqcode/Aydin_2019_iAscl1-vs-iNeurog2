## Assumes sorting on the 2nd column, which is usually the binding strength
INPUT=${1}

grep -v "Infinity" $INPUT | grep -v "infinity" | grep -v "inf" | grep -v "Inf" | sort -k2 -n > tmp_normal
awk 'NR==FNR{$A[$1];next}!($1 in A){print $0}' tmp_normal $INPUT > tmp_inf

cat tmp_inf tmp_normal

rm tmp_normal
rm tmp_inf

