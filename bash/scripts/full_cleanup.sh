#!/bin/bash

echo "This will permanently delete:"
echo "  - the .sampledata folder"
echo "  - all .test.*.csv files"
read -r -p "Are you sure? (y/N) " answer

case "$answer" in
    [Yy]|[Yy][Ee][Ss])
        rm -rf .sampledata
        rm -f .test.*.csv
        echo "Cleanup done."
        ;;
    *)
        echo "Cleanup Cancelled."
        exit 1
        ;;
esac
