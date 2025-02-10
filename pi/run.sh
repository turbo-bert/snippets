#!/bin/bash



C=$(ls -1 /Users/robertdegen/Desktop/DIAs | wc -l | awk '{ print $1 }')
((C=C+1))


ssh oink2 'libcamera-still -o test.jpg -t 500 -n'
scp oink2:/root/test.jpg .
cat test.jpg >dia_$C.jpg
op test.jpg
