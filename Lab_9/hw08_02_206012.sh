#!/bin/bash


filenames=$(ls "$1" |sed '/[A-Z]/d'| grep ".txt$")
for file in $filenames
do
echo "$file"
filename=$(echo "$file" | awk '{split($1,arr,".");print arr[1]}')
mv "$1/$file" "$2/$filename.moved_txt"
done