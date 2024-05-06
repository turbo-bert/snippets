#!/bin/bash


SRC=${1:-PC000005.MP4}
TITLE=${2:-Video Log}
ONLY="-t 00:00:10"
ONLY=""

creation_time=$(ffmpeg -i $SRC 2>&1 | grep creation_time | head -1 | sed -E 's/.* ([^ ]+)/\1/g' | cut -d '.' -f 1 | tr ':' '-' | tr 'T' ' ')

location_spec=$(ffmpeg -i $SRC 2>&1 | grep location | head -1 | awk '{print $NF}' | tr -d '/')

dur_spec=$(ffmpeg -i $SRC 2>&1 | grep -i duration | head -1 | awk '{print $2}' | tr -d ',' | cut -d '.' -f 1 | awk -F ':' '{print $1 "h" $2 "m" $3 "s"}')


echo "continue with..."
echo "(time $creation_time) (location $location_spec) (dur $dur_spec) ?"
read


#https://stackoverflow.com/questions/17623676/text-on-video-ffmpeg
F2="/System/Library/Fonts/Supplemental/DIN Alternate Bold.ttf"
F1="/System/Library/Fonts/Supplemental/Tahoma.ttf"
ffmpeg -i $SRC \
    -vf "drawtext=fontfile=$F1:text='[${location_spec}] [${dur_spec}] [${creation_time}Z] [%{pts}s]':fontcolor=white:fontsize=18:box=1:boxcolor=black@0.5:boxborderw=15:x=10:y=25,drawtext=fontfile=$F1:text='$TITLE':fontcolor=white:fontsize=18:box=1:boxcolor=black@0.5:boxborderw=15:x=10:y=80" \
    -vb 650k \
    -ac 1 \
    -y $ONLY $SRC.encoded.mp4


#    -t 00:00:15 \
