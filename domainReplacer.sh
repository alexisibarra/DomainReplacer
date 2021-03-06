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

    find $directory \
    -type f \
    -name "*.$extension" \
    -not -path $gitDirectory'/*' \
    -not -name '*.[jJ][pP][gG]*' \
    -not -name '*.[pP][nN][gG]*' \
    -not -name '*.[pP][dD][fF]*' \
    -not -name '*.[zZ][iI][pP]*' \
    -not -name '*.[bB][mM][pP]*' \
    -not -name '*.[tT][iI][fF]*' \
    -not -name '*.[wW][oO][fF]*' \
    -not -name '*.[wW][oO][fF][fF]*' \
    -not -name '*.[sS][vV][gG]*' \
    -not -name '*.[eE][oO][tT]*' \
    -not -name '*.doc*' \
    -not -name '*.php*' \
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
    -not -name '*.gitattributes*' \
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
    -not -name '*.sys*' \
    -print0 \
    | while IFS= read -r -d $'\0' file;
        do
            echo "Analizing $file"
            perl -i -pe 's/href="(http:\/\/|)www.movistar.com.ve"/href="\/"/g;' $file
            perl -i -pe 's/href="(http:\/\/|)www.movistar.com.ve/href="/g;' $file
            perl -i -pe 's/href="(http:\/\/|)movistar.com.ve/href="/g;' $file
            perl -i -pe 's/src="(http:\/\/|)movistar.com.ve/src="/g;' $file
            perl -i -pe 's/http:\/\/www.movistar.com.ve/http:\/\/www.movistarve.com/g;' $file
            perl -i -pe 's/www.movistar.com.ve/www.movistarve.com/g;' $file
            perl -i -pe 's/mi.movistar.com.ve/mi.movistarve.com/g;' $file
            # perl -i -pe 's/([^.]*.)movistar.com.ve/$1movistarve.com/;' $file
        done

    IFS=$SAVEIFS
}

replaceInFiles "*"