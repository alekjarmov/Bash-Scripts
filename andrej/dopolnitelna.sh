#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: <day/Mon> <total_time_in_system> <file>"
    exit 1
fi
rm -f "rezultat.txt"
touch rezultat.txt

filtered=$(last | awk '{if($4 ~ /'$1'/ && $3 ~ /^'$3'/ ) print $0}')

#find people who were logged in longer than 2 hours

while IFS= read -r line || [ -n "$line" ]; do
    user=$(echo "$line" | awk '{print $1}')
    mins=$(last | grep "^$user" | awk '{print $NF}' | sed 's/(//' | sed 's/)//' | awk '{split($1,arr,":");print (arr[1]*60 + arr[2])}' | awk 'BEGIN{mins=0}{mins+=$1}END{print mins}')
    if [ $mins -ge "$2" ]; then

        echo $line | awk '{print $1}' >> rezultat.txt
    fi

done <<<"$filtered"

echo "People who were logged in longer than $2 minutes:"

tekst=$(cat rezultat.txt | sort | uniq)
 >"rezultat.txt"
for word in $tekst:
do
    echo $word >> rezultat.txt
done
cat rezultat.txt