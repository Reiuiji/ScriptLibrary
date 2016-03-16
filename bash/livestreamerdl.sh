#!/bin/bash
#title        :livestreamerdl.sh
#description  :Live Streamer Downloader
#author       :Reiuiji
#license      :GPL
#date         :20140104
#version      :1
#usage        :bash livestreamerdl.sh <stream url> <Quality> <Save Location>

: ${3?"Usage: $0 <Stream Vid> <Quality> <Output>"}

i=1
while [ $i -le 100 ]
do
{
date=`date`
out="$3-${i}.flv"
echo "Date: ${date}" >> "$3"-info.txt
echo "Executing: livestreamer $1 $2 -o $out" >> "$3"-info.txt

livestreamer $1 $2 -o $out >> $3-info.txt

sleep 20

i=$(( $i + 1 ))
}
done
