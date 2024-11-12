#!/usr/bin/env bash

path=$1
if test -z "$path"; then
    echo "Missing path"
    exit 1
fi

file=${path##*/}
outfile="${file%%.*}_blur.${file#*.}"

convert "$file" -blur 0x8 "$outfile"
