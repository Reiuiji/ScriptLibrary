#!/bin/bash
#title        :security_write.sh
#description  :Bash script to write sha256/512 and whirpool to a file.sig
#author       :Reiuiji
#license      :GPL
#date         :20140611
#version      :1
#usage        :bash security_write.sh <file>

echo "FILE: $1"
NEWFILE="$1.Manifest"
echo "Proceeding MD5"
MD5=(`md5sum $1`)
echo "Proceeding SHA256"
SHA256=(`sha256sum $1`)
echo "Proceeding SHA512"
SHA512=(`sha512sum $1`)

echo -e "FILE : $1\n\n  MD5    : ${MD5[0]}\n  SHA256 : ${SHA256[0]}\n  SHA512 : ${SHA512[0]}" > $NEWFILE
