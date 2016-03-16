#!/bin/bash
#title        :dice.sh
#description  :Rolls and calculate total for one type of Dice
#author       :Reiuiji
#license      :GPL
#date         :20140123
#version      :1
#usage        :bash Dice.sh

: ${2?"Usage: $0 <Dice Type> <Quality>"}

echo "--Dice Rolled--"

i=1
total=0
while [ $i -le $2 ]
do
{
DiceRole="$[ 1 + $[ RANDOM % $1 ]]"
echo -e "$i \t $DiceRole"
total=$(( $total + $DiceRole ))

i=$(( $i + 1 ))
}
done 

echo "Total = $total / $[ $1 * $2 ]"
