#!/bin/bash

R=1
PAT="capture-%03d.png"
ffmpeg -r $R -i $PAT -y -vf format=gray rotate-x.gif
