#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 NAME"
    exit 1
fi

echo "Hello, $1"
