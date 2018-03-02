#!/bin/bash

usage="$(basename "$0") [-h] [-s source_directory] [-d destination_directory] [-n name_archive] [-e extensions] --backup all files with code and those extension 
where:
    -h  show this help text
    -s  source directory
    -d  destination directory
    -n  name archive
    -e  comma-separated extensions of files"

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
    EXTENSIONS="$2"
    shift # past argument
    shift # past value
    ;;
    -h)
    echo "${usage}"
    shift
    ;;
    *)    # unknown option
    echo "Error Unknown option $*"
    echo "Try ${usage}"
    shift # past argument
    ;;
esac
done
 


echo "${EXTENSIONS}"
echo "${SEARCHPATH}"
