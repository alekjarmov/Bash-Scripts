#!/bin/bash
touch helper.txt
#cat modified.txt > helper.txt
lol=$(ls -l)

while IFS= read -r line || [ -n "$line" ]  ;do
echo $line
done <<<"$lol"
# samo ako e file done < filename.extension
rm helper.txt