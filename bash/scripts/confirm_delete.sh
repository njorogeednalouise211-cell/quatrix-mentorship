#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 FILE"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File does not exist"
    exit 1
fi

read -r  -p "Are you sure you want to delete $1? (y/n): " answer

if [ "$answer" = "y" ]; then
    rm -- "$1"
    echo "File $1 deleted"
else
    echo "Deletion $1 cancelled"
fi
