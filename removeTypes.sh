#!/bin/bash
echo "Prv nacin"

$(ls -l | awk '{print $NF;}' | sed 's/\..*$//')