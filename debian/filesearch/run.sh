#!/bin/bash


N=${1:-ls}
curl -s -o out -L "https://packages.debian.org/search?searchon=contents&keywords=$N&mode=exactfilename&suite=stable&arch=any"
cat out | grep -i "your search gave no results"
ec=$?

if [[ $ec = 0 ]]; then
    echo "$N is free"
else
    echo "$N exists!"
fi
