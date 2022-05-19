#!/bin/bash
today=$(date | awk '{print  $3" "$2;}' | sed 's/,//g' )
files=$(ls -l ~)
IFS=$'\n' read -ra ADDR -d $'\0' <<< "$files"
touch modified.txt
> modified.txt 
for file in "${ADDR[@]}"
do
echo $file
echo $today
filedate=$(echo "$file" | awk '{print $8 " " $7}')
echo $filedate
if [ "$today" = "$filedate" ]
then
echo "Im in"
echo $file >> modified.txt 
fi
done
cat modified.txt