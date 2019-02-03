INPUT=${1}
cut -f1 $INPUT | awk -F ":" '{print $1"\t"$2}' | awk -F "-" '{print $1"\t"$2"\t"$3}' | awk '{print $1"\t"$2"\t"$3"\t"$1":"$2"-"$3}' 
