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


replaceInFiles () {
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

    extension=$1
    regex=$2
    find $directory \
    -type f \
    -name "*.$extension" \
    -not -path $gitDirectory'/*' \
    -not -name '*.(pdf|jpg|jpeg|png|gif|psd)' \
    -print0 \
    | while IFS= read -r -d $'\0' file; 
        do
            echo "Analizing $file"
            perl -i -pe $regex $file
        done

    IFS=$SAVEIFS
}

replaceInFiles "html" 's/href="www.movistar.com.ve//;'
replaceInFiles "asp" 's/href="www.movistar.com.ve//;'