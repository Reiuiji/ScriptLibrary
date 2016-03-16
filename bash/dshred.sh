#!/bin/bash
#title        :dshred.sh
#description  :Utility that will shreed up data recursivly
#author       :Reiuiji
#license      :GPL
#date         :20130721
#version      :1
#usage        :bash Dice.sh

if [[ $# < 1 ]]
then
	echo "Usage $0 <DIR> [shred commands]"
	exit 1
fi

DIR=`realpath $1`

if [[ ! -d "$DIR" ]]
then
	echo "Directory $DIR does not exist"
	exit 1
fi

echo -n "Deleting $DIR : your sure? (y/n) "
read choice

if [[ ! "$choice" == "y" ]]
then
	echo "Exiting"
	exit 0
fi

echo "Deleting $DIR"

args=${*:2}

#Delete file
find $DIR -type f -print -exec shred -fuz $args {} \; #-exec rm $args {} \;
#Unlink links
find $DIR -type l -exec rm $args {} \;
#remove all Directories
rm -rf $DIR

#echo "find $DIR -type f -exec shred $args {} \; -exec rm $args {} \;"
#echo "rm -rf $DIR"

echo "$DIR is deleted!"
#find <dir> -type f -exec shred -v {} \;
##unlink those pesky links to other lands
#find <dir> -type l -exec unlink {} \;
#rm -rf <dir>
#
#-type c
#              File is of type c:
#
#              b      block (buffered) special
#
#              c      character (unbuffered) special
#
#              d      directory
#
#              p      named pipe (FIFO)
#
#              f      regular file
#
#              l      symbolic link; this is never true if the -L option or the -follow option is in effect, unless the symbolic link is
#                     broken.  If you want to search for symbolic links when -L is in effect, use -xtype.
#
#              s      socket
#
#              D      door (Solaris)
