INPUT=${1}
cut -f1 $INPUT | awk -F ":" '{print $2}' | awk -F "-" '{print $2-$1}' 

