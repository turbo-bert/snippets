#!/bin/bash


RRLIMIT=300
WD=/ramdisk

if [[ ! -z $1 ]]; then
mkdir /ramdisk && mount -t tmpfs -o size=512M tmpfs /ramdisk
exit 0
fi


while true; do

export TZ=Europe/Berlin
#D=$WD && SE=$(date +%s) && fswebcam --rotate 180 -r 640x480 -S 5 --title "FLAT-ENTRANCE-$SE-$(date '+%H:%M:%S')" $D/capture-$SE.jpg && rm -f $D/latest.jpg && ln -s $D/capture-$SE.jpg $D/latest.jpg





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


FPS=1
( cd $WD && rm -f latest.gif )
( cd $WD && ffmpeg -r $FPS -i 'frame%05d.jpg' -y -vf format=gray latest.gif )
( cd $WD && ffmpeg -r $FPS -i 'frame%05d.jpg' -y -vf format=gray -force_key_frames 'expr:gte(t,n_forced*5)' latest.mp4 )

for XSLEEP in $(seq 1 15); do
    sleep 2
    NEWEST=$(cd $WD && ls -1 capture*jpg | tail -1)
    rm -f $WD/latest.jpg && ln -s $WD/$NEWEST $WD/latest.jpg
done

done
