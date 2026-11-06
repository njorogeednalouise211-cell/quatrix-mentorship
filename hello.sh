#!/bin/bash
echo "Hello, $USER. Today is $(date +%A)."
echo "First argument: $1, count: $#"
if [ -f "$1" ]; then
    echo "$1 is a file"
elif [ -d "$1" ]; then
    echo "$1 is a directory"
else
    echo "$1 does not exist"
fi
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 FOLDER" >&2     # >&2 sends the message to stderr
    exit 1
fi
