#!/bin/bash

usage="$(basename "$0") [-h] [-s source_directory] [-d destination_directory] [-n name_archive] [-e extentions] --backup all files with code and those extention 
where:
    -h  show this help text
    -s  source directory
    -d  destination directory
    -n  name archive
    -e  space-separated extensions of files"

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s)
    SOURCE="$2"
    shift # past argument
    shift # past value
    ;;
    -d)
    DEST="$2"
    shift # past argument
    shift # past value
    ;;
    -n)
    NAME="$2"
    shift
    shift
    ;;
    -e)
    EXTENTIONS="$@"
    shift # past argument
    shift # past value
    ;;
    -h)
    echo "${usage}"
    shift
    ;;
    -*)    # unknown option
    echo "Error Unknown option $*"
    echo "Try ${usage}"
    shift # past argument
    ;;
    *)
    shift
    ;;
esac
done

for extention in $EXTENTIONS
do 
    find $SOURCE -name *.$extention > all_files
    input="./all_files"
    while IFS= read -r full_filename
    do
	full="$full_filename"
	path=${full%/*}
	#echo "$path"
	mkdir -p ./$DEST/$path
	cp $full_filename ./$DEST/$full_filename
    done < "$input"
done

tar -cf $NAME.tar.gz $DEST
rm -r $DEST
echo "done"

