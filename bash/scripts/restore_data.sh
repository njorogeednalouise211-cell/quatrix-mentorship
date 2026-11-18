#!/bin/bash

for dir in A-F G-L M-R S-Z; do
    [ -d "$dir" ] || continue
    mv -n -- "$dir"/*.txt .sampledata/ 2>/dev/null
    rmdir "$dir"
done
