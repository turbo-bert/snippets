#!/bin/bash

R=1
PAT="front-%d.jpg"
ffmpeg -r $R -i $PAT -y out.mp4
