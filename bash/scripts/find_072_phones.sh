#!/bin/bash
cut -d';' -f3 .test.student.csv | grep '^072'
