#!/bin/bash

den=`date|awk '{print $3}'`
mesec=`date|awk '{print $2}'`

files=`ls`
rm modified.txt
for f in $files
do

        m=`ls -l $f|awk '{print $7}'`
        d=`ls -l $f|awk '{print $8}'`
        if [ $m = $mesec ] && [ $d = $den ]
        then
                echo $f >> modified.txt
        fi
done
cat modified.txt