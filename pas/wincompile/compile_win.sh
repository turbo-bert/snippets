#!/bin/bash


ssh -t lz 'rmdir /S /Q c:\wmt\src'
scp -r src lz:/wmt
ssh -t lz 'cd \wmt\src & c:\lazarus30\lazbuild.exe wmt.lpi'
#scp lz:/wmt/src/wmt.exe .
#ssh -t lz 'rmdir /S /Q c:\wmt\src'
