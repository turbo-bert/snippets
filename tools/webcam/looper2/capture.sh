#!/bin/bash


RRLIMIT=50
WD=/ramdisk

if [[ ! -z $1 ]]; then
mkdir /ramdisk && mount -t tmpfs -o size=512M tmpfs /ramdisk
exit 0
fi


export TZ=Europe/Berlin
D=$WD && SE=$(date +%s) && fswebcam --crop 320x240,160x130 --loop 1 --rotate 180 -r 640x480 -S 5 --title "FLAT-ENTRANCE" --timestamp "%Y-%m-%d %H:%M:%S (%Z)" --save $WD/capture.jpg --exec "mv $WD/capture.jpg $WD/capture-%H%M%S.jpg"
