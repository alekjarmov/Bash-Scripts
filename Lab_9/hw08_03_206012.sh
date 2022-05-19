#!/bin/bash
if [ $# -ne 2 ]
then
echo "Potrebno e da vnesete 2 Folderi, edniot od koj ke se premestat fileovite vo drugiot"
exit 1
fi
if [ ! -d $1 ] || [ ! -d $2 ]
then
echo "Potrebno e da vnesete 2 Folderi, edniot od koj ke se premestat fileovite vo drugiot"
exit 1
fi

filenames=$(ls "$1" |sed '/[A-Z]/d'| grep ".txt$")
totalsize=0

for file in $filenames
do
filesize=$(ls -l  "$1/$file" | awk '{print $6}')
echo "$file"
totalsize=$(( totalsize + filesize))
filename=$(echo "$file" | awk '{split($1,arr,".");print arr[1]}')
mv "$1/$file" "$2/$filename.moved_txt"
done
echo "Goleminata na premestenite files e $totalsize"