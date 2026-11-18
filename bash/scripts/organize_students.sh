#!/bin/bash
 
mkdir -p A-F G-L M-R S-Z
 
for file in .sampledata/*.txt
do
    [ -f "$file" ] || continue
 
    name=${file##*/}
    name=${name#*_}
    first=${name:0:1}
 
    case "$first" in
        [A-Fa-f]) mv "$file" A-F/ ;;
        [G-Lg-l]) mv "$file" G-L/ ;;
        [M-Rm-r]) mv "$file" M-R/ ;;
        [S-Zs-z]) mv "$file" S-Z/ ;;
    esac
done
