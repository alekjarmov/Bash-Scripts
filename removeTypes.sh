#!/bin/bash
echo "Prv nacin"

echo $(ls -l | awk '{print $NF;}' | sed 's/\..*$//')

echo "Vtor nacin"

echo $( ls -l | awk '{print $NF}' | awk '{split($1,arr,".");print arr[1]}')