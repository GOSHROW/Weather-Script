#!/bin/bash
# CLI on igor_chubin's project
# GOSHROW

path=`pwd`
weather_path="${path}/weather.sh"

crontab -l > weathercron
#use -e flag if no crontabs already
echo "1 * * * * ${weather_path} ${1} ${2} && open -f Terminal" >> weathercron

crontab weathercron