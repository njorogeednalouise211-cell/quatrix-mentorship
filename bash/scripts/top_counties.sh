#!/bin/bash
 
N=${1:-5}
 
awk -F';' 'NR==FNR {name[$1]=$2; next} {n[$4]++} END {for (id in n) printf "%s\t%d\n", name[id], n[id]}' \
    .test.county.csv .test.student.csv | sort -t$'\t' -k2,2nr | head -n "$N"
