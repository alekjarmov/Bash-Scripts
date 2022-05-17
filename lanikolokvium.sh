#!/bin/bash

if [ $# -ne 1 ]
then
echo "Vnesi 1 argument"
exit 1
fi
>$1
sizes=$(ls -l  | grep ".txt" | awk '{print $5}')
# echo $sizes
avg=0
cnt=0
for size in $sizes
do 
# echo $size
avg=$((avg + $size))
cnt=$((cnt + 1 ))
done
avg=$((avg/cnt))

# Ne mora ova vaka moze da vidime info za odreden file so ls -l filename.txt
files=$(ls -l | grep '^-'| grep '.txt' | awk '{if ($5 <= '$avg')print $NF;}')
# echo $files
for file in $files
do
actualfile=$(cat "$file")

numsentences=$(cat "$file" |awk '{n=split($0,arr,".");split(n,X," ");sum = int(0);
for (i in X){ sum += int(X[i]);}print sum}')
echo $numsentences
solution=""
for line in $actualfile
do
# echo $line
lol=$(echo "$line"| sed 's/,//g')
solution="$solution $lol" # interesen nacin za dodavanje na string
done

filee=$(echo "$file" | sed '{s/\..*//}')
#echo $numsentences
sum=0
for i in $numsentences
do
sum=$((sum+$i))
done
printf "%s,%s,%s\n" "$filee" "$solution" $sum  >> $1
done