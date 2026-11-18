#!/bin/bash
 
FILE=".test.student.csv"
 
if [ -z "$1" ]; then
    echo "Usage: $0 <first_name>" >&2
    exit 1
fi
 
if [ ! -f "$FILE" ]; then
    echo "Error: $FILE not found" >&2
    exit 1
fi
 
cut -d';' -f2 "$FILE" | awk -v name="$1" '$1 == name {n++} END {print n+0}'
