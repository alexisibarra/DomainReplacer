#!/bin/bash

if [ -z ${1+x} ]; 
then 
    echo "Please, type the directory you want to look up"
    read directory
else 
    directory=$1
fi

git='/git'
gitDirectory=$directory$git
stringToReplace='http:\/\/www.movistar\.com\.ve'
replacementString=''

echo "Looking in $directory"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

find $directory \
 -type f \
 -name "*.xml" \
 -not -path $gitDirectory'/*' \
 -print0 \
 | while IFS= read -r -d $'\0' file; 
    do
        echo "Analizing $file"
        perl -i -pe 's/www.movistar.com.ve//;' $file
    done

IFS=$SAVEIFS