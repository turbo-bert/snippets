#!/bin/bash


RRLIMIT=10
WD=/ramdisk

if [[ ! -z $1 ]]; then
mkdir /ramdisk && mount -t tmpfs -o size=512M tmpfs /ramdisk
exit 0
fi

D=$WD && SE=$(date +%s) && TZ=Europe/Berlin && fswebcam -r 640x480 -S 5 --title "FLAT-ENTRANCE-$SE" $D/capture-$SE.jpg && rm -f $D/latest.jpg && ln -s $D/capture-$SE.jpg $D/latest.jpg



while true; do
    RRCOUNT=$(cd /ramdisk && ls -1 capture*jpg | wc -l)
    OLDEST=$(cd /ramdisk && ls -1 capture*jpg | head -1)
    
    if [[ $RRCOUNT -gt $RRLIMIT ]]; then
	rm -f "$WD/$OLDEST"
    else
	break
    fi
done


