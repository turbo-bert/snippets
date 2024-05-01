#!/bin/bash


ffmpeg -i 'http://192.168.178.22:8081/101/stream' -t 00:00:01 bla.mp4

# just a frame
#ffmpeg -i 'http://192.168.178.22:8081/101/stream' -t 00:00:02 -vf "select=eq(n\,10)" -vframes 1 bla.jpg