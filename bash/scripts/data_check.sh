#!/bin/bash
 
S=".test.student.csv"
C=".test.school.csv"
 
echo "Students:           $(wc -l < $S)"
echo "No phone number:    $(cut -d';' -f3 $S | grep -c '^$')"
echo "No middle initial:  $(cut -d';' -f2 $S | grep -vc ' . ')"
echo "Duplicate emails:   $(cut -d';' -f6 $S | sort | uniq -d | wc -l)"
echo "Unknown school IDs: $(cut -d';' -f5 $S | grep -vxFf <(cut -d';' -f1 $C) | wc -l)"
