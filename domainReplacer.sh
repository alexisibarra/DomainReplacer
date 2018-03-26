#!/bin/bash

if [ -z ${1+x} ]; 
then 
    echo "Please, type the directory you want to look up"
    read directory
else 
    directory=$1
fi

git='/.git'
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
    -not -name '*.[html|asp|jpg|JPG|png|PNG|pdf|old]*' \
    -not -name '*.[zZ][iI][pP]*' \
    -not -name '*.[bB][mM][pP]*' \
    -not -name '*.[tT][iI][fF]*' \
    -not -name '*.[wW][oO][fF]*' \
    -not -name '*.[wW][oO][fF][fF]*' \
    -not -name '*.[sS][vV][gG]*' \
    -not -name '*.[eE][oO][tT]*' \
    -not -name '*.css*' \
    -not -name '*.js*' \
    -not -name '*.doc*' \
    -not -name '*.php*' \
    -not -name '*.xml*' \
    -not -name '*.xlsx*' \
    -not -name '*.xls*' \
    -not -name '*.ppt*' \
    -not -name '*.exe*' \
    -not -name '*.ico*' \
    -not -name '*.swf*' \
    -not -name '*.ttf*' \
    -not -name '*.rar*' \
    -not -name '*.avi*' \
    -not -name '*.pkg*' \
    -not -name '*.dmg*' \
    -not -name '*.mp4*' \
    -not -name '*.txt*' \
    -not -name '*.shs*' \
    -not -name '*.fla*' \
    -not -name '*.jar*' \
    -not -name '*.jad*' \
    -not -name '*.kml*' \
    -not -name '*.md*' \
    -not -name '*.inc*' \
    -not -name '*.log*' \
    -not -name '*.emf*' \
    -not -name '*.pxr*' \
    -not -name '*.wmv*' \
    -not -name '*.cod*' \
    -not -name '*.gitignore*' \
    -not -name '*.gitattributes*' \
    -not -name '*.as*' \
    -not -name '*.cgi*' \
    -not -name '*.py*' \
    -not -name '*.pl*' \
    -not -name '*.scc*' \
    -not -name '*.htc*' \
    -not -name '*.cfm*' \
    -not -name '*.lasso*' \
    -not -name '*.afp*' \
    -not -name '*.flv*' \
    -not -name '*.XLS*' \
    -not -name '*.cfc*' \
    -not -name '*.config*' \
    -not -name '*.yml*' \
    -not -name '*.config*' \
    -not -name '*.sys*' \
    -not -name '*.bak*' \
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