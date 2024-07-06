#!/bin/bash


rm -f ~/bin/pym
T=`pwd`/run.sh

echo "target [$T]"
( cd ~/bin && ln -s $T pym )
