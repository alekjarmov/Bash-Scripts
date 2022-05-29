#!/bin/bash

function recurse(){
    for file in "$1"/*
    do
        if [ -d "$file" ]
        then
            recurse "$file"
        else
            echo "$file"
        fi
    done
}

#get files which have been modified in a period between x and y days
function get_modified_files(){
    local x=$1
    local y=$2
    local files=$(find . -type f -mtime -$x -mtime +$y)
    for file in $files;do
        echo $file
    done

    echo $files
}
