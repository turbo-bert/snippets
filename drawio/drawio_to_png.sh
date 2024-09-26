#!/bin/bash



if [[ -f $1 ]]; then
    /Applications/draw.io.app/Contents/MacOS/draw.io --export --output $1.png $1
fi

