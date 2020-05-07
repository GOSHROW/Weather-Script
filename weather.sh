#!/bin/bash
# CLI on igor_chubin's project
# GOSHROW

url="http://wttr.in"

len=0

if [[ $1 == -* ]]; then
    if [ $1 == "-b" ] || [ $1 == "--basic" ]; then
        len=7
    elif [ $1 == "-t" ] || [ $1 == "--today" ]; then
        len=17
    elif [ $1 == "-e" ] || [ $1 == "--entire" ]; then
        len=0
    elif [ $1 == "-l" ] || [ $1 == "--location" ]; then
        len=-1
    else
        echo "Invalid"
        exit
    fi
    url="${url}/${2}"
else
    url="${url}/${1}"
fi

weather=`curl -s $url`
touch tempweatherfile
echo "$weather" >> tempweatherfile

if [[ $len == 0 ]]; then
    cat tempweatherfile
elif [[ $len == -1 ]]; then
    tail -3 tempweatherfile | head -1
else
    head -$len tempweatherfile
fi

rm tempweatherfile