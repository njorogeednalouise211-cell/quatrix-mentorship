#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <county_id>" >&2
    exit 1
fi

awk -F';' -v id="$1" '$4 == id {n++} END {print n+0}' .test.student.csv
