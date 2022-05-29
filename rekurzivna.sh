#!/bin/bash

inf() {
    echo $1
    dpth=$(( $1 +1 ))
    inf $dpth
}

inf 0