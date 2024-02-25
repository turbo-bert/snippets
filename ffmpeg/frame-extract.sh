#!/bin/bash

# frame 11 == 10 in command
ffmpeg -i test.mp4 -vf "select=eq(n\,10)" -vframes 1 test.jpg
