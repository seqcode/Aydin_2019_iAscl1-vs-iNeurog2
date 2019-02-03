while getopts "i:" OPTION
do
        case "$OPTION" in
                i)
                        FILE=$OPTARG
                        ;;
        esac
done

while read line
do
	~/group/software/sratoolkit.2.3.5-2-ubuntu64/bin/fastq-dump --split-3 $line
done < 	$FILE
