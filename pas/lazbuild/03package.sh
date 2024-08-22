#!/bin/bash


A=$(cat N)


if [[ -f $A/$A ]]; then
    rm -f $A/$A.app/Contents/MacOS/$A
    mv $A/$A $A/$A.app/Contents/MacOS/$A
    ( cd $A && zip -r ../$A-setup.zip $A.app )
else
    echo "binary missing $A/$A"
    exit 1
fi
