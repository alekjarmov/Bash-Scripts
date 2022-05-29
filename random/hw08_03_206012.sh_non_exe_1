#!/bin/bash
if [ $# -ne 2 ]
then
echo "USAGE: source_directory destination_directory"
echo "Incorrect number of arguments!"
exit 1
fi
if [ ! -d $1 ] || [ ! -d $2 ]
then
echo "USAGE: source_directory destination_directory"
echo "One or both of the arguments are not folders."
exit 1
fi

filenames=$(ls "$1" | grep ".txt$" |sed '/[A-Z]/d')
totalsize=0

for file in $filenames
do
filesize=$(ls -l  "$1/$file" | awk '{print $6}')
totalsize=$(( totalsize + filesize))
filename=$(echo "$file" | sed 's/\.txt/\.moved_txt/')
mv "$1/$file" "$2/$filename"
done
echo "Goleminata na premestenite files e $totalsize"