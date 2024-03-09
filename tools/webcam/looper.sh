#!/bin/bash


RRLIMIT=50
WD=/ramdisk

if [[ ! -z $1 ]]; then
mkdir /ramdisk && mount -t tmpfs -o size=512M tmpfs /ramdisk
exit 0
fi


while true; do

export TZ=Europe/Berlin
D=$WD && SE=$(date +%s) && fswebcam -r 640x480 -S 5 --title "FLAT-ENTRANCE-$SE-$(date '+%H:%M:%S')" $D/capture-$SE.jpg && rm -f $D/latest.jpg && ln -s $D/capture-$SE.jpg $D/latest.jpg



while true; do
    RRCOUNT=$(cd $WD && ls -1 capture*jpg | wc -l)
    OLDEST=$(cd $WD && ls -1 capture*jpg | head -1)
    
    if [[ $RRCOUNT -gt $RRLIMIT ]]; then
	rm -f "$WD/$OLDEST"
    else
	break
    fi
done



ORDERED=$(cd $WD && ls -1 capture*jpg)
(cd $WD && rm -f frame*.jpg)

FRAME=0
for IMG in $ORDERED; do
    SFRAME=`printf "%05d" $FRAME`
    ( cd $WD && ln -s $IMG frame$SFRAME.jpg )
    ((FRAME=FRAME+1))
done


FPS=2
( cd $WD && rm -f latest.gif )
( cd $WD && ffmpeg -r $FPS -i 'frame%05d.jpg' -y -vf format=gray latest.gif )

sleep 10

done
