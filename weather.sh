#!/bin/bash
#CLI on igor_chubin's project

url="http://wttr.in"

len=0

if [[ $1 == -* ]]; then
    if [[ $1 == "-b" ]]; then
        len=7
    elif [[ $1 == "-t" ]]; then
        len=17
    elif [[ $1 == "-e" ]]; then
        len=0
    elif [[ $1 == "-l" ]]; then
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
# echo $weather
touch tempweatherfile
echo "$weather" >> tempweatherfile

if [[ $len == 0 ]]; then
    cat tempweatherfile
elif [[ $len == -1 ]]; then
    tail -3 tempweatherfile
else
    head -$len tempweatherfile
fi

rm tempweatherfile