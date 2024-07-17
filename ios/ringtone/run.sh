#!/bin/bash


ffmpeg -i src.wav -map_metadata -1 -ac 1 -b:a 128k -f mp4 -c:a aac -t 29.5 stars.m4r

