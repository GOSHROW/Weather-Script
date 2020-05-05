#!/bin/bash
#CLI on igor_chubin project

url="http://wttr.in"
url="${url}/${1}"

weather=`curl -s $url`
touch tempfile
echo "$weather" >> tempfile

head -7 tempfile