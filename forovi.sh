#!/bin/bash
echo '$@ gi pecati site vlezni argumenti isto kako $*' "$@" '=' "$*"
echo '$$ dava random process number' "$$"
echo '$# dava broj na vlezni argumenti' $#

pole=("pole1" "pole2" "pole3")
string="da da ok ok"
for i in $string
 do
    echo $i 
 done
echo "Razlicni naacini za for iteriranje niz niza"
for i  in ${pole[*]}
do
echo $i
done 
printf '\n'
for i  in ${pole[@]}
do
echo $i
done 
printf '\n'
for i  in "${pole[@]}"
do
echo $i
done 