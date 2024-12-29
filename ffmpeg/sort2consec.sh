#!/bin/bash


FIND=gfind

#echo -n "iname pattern: "
#read PAT
PAT="stilld-*.jpg"

#echo -n "outdir:"
#read D
D=out

#mkdir $D
#gfind . -maxdepth 1 -iname "$PAT" -type f | sort >$D/ALL


#((I=0))
#for F in $(cat $D/ALL); do
#    II=$(printf "%08d" $I)
#    CMD="ln -s .$F frame$II.jpg"
#    ( cd $D && $CMD )
#    ((I=I+1))
#done

( cd $D && ffmpeg -r 1 -i "frame%08d.jpg" -y -s 1920x1080 $D.mp4 )
