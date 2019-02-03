INPUT=${1}
cut -f1 $INPUT | awk -F ":" '{print $1"\t"$2"\t"($2+1)"\t"$0}' 
