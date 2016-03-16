#!/bin/bash
#title        :nsfw_checker.sh
#description  :Bash script to analyze a image and tell if it is sfw/nsfw
#author       :Reiuiji
#license      :GPL
#date         :20160316
#version      :1
#usage        :bash nsfw_checker.sh <Image URL>

TOKKEN=
if [ -z ${TOKKEN:+x} ]
then
    echo "Need a token from clarifai.com"
    exit
fi

URL=$1

RESULTS="$(curl "https://api.clarifai.com/v1/tag/?model=nsfw-v0.1&url=$URL" -H "Authorization: Bearer $TOKKEN" 2>/dev/null )"

#echo "$RESULTS"

#Grab classes tags
CLASSES="$(echo $RESULTS | grep -Po '(?<="classes": \[)[^]]*')"
#Grab probs tags
PROBS="$(echo $RESULTS | grep -Po '(?<="probs": \[)[^]]*')"

if [ -z ${CLASSES:+x} ]
then
    echo "Status Failed"
    exit -1
else
    echo "Status OK"
fi

CARR=( $(echo $CLASSES | cut -d "\"" -f2,4 --output-delimiter=" ") )
#echo "${CARR[0]}"

PARR=( $(echo $PROBS | tr "," " ") )
#echo "${PARR[0]}"

#echo "Image Detected being ${CARR[0]} %${PARR[0]}"

if [ ${CARR[0]} == "sfw" ]
then
    echo "Safe for Work: ${PARR[0]}"
else
    echo "Not Safe for Work: ${PARR[0]}"
fi
