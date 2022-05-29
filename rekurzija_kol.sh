#!/bin/bash
inf() {
    # $1 depth $2currfolder $3 konstanta src
    folders=$(ls -l $2 | grep "^d" | awk '{print $NF}')
    depth=$(($1 + 1))
    files=$(ls -l $2 | grep "^-" | awk '{print $NF}' | grep ".sh$")
    
    echo $*
    for file in $files; do
        
        name=$(echo $file | awk '{split($1,arr,".");print arr[1]}')
        size=$(ls -l "$2/$file" | awk '{print $5}')
        echo $size $totalsize
        totalsize=$((size + totalsize))
        echo $totalsize
        cp "${2}/${name}.sh" "${3}/${name}.sh_non_exe_${1}"
    done

    for folder in $folders; do
        inf $(($1 + 1)) "$2/$folder" $3
    done
    return $totalsize
}


if [ $# -ne 3 ]; then
    echo "USAGE: src dest size"
fi
if [ ! -d $1 ] || [ ! -d $2 ] || [ ! -d $3 ]; then
    echo "Vnesi 3 fodleri"
fi

totalsize=0

inf 1 $1 $2

echo $totalsize