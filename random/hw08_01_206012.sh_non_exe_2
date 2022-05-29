#!/bin/bash
today=$(date | awk '{print  $3" "$2;}')
files=$(ls -l ~ | grep "^-")
touch modified.txt
> modified.txt
while IFS= read -r file || [ -n "$file" ];do
filedate=$(echo "$file" | awk '{print $8 " " $7}')
if [ "$today" = "$filedate" ]
then
echo $file | awk '{print $NF}' >> modified.txt 
fi
done <<<"$files"
cat modified.txt
