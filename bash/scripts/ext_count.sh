#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 FOLDER"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: $1 is not a folder"
    exit 1
fi

count=$(find "$1" -maxdepth 1 -type f | wc -l)

echo "There are $count files in $1"

