#!/bin/bash


filenames=$(ls "$1" | grep ".txt$" |sed '/[A-Z]/d')
for file in $filenames
do
filename=$(echo "$file" | sed 's/\.txt/\.moved_txt/')
mv $1/$file $2/$filename
done