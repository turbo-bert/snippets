#!/bin/bash


H=werkstatt

rm -f deploy.tgz
gtar cvfz deploy.tgz deploy

RDN=custom-ramdisk
RDSIZE=1G

ssh $H "mkdir -p /$RDN"
ssh $H "mount -o size=$RDSIZE -t tmpfs none /$RDN"

scp deploy.tgz $H:/$RDN
ssh $H "cd /$RDN && tar xvfz deploy.tgz"

ssh $H "cd /$RDN/deploy && tmux new-session -d -t $RDN"
ssh $H "tmux send-keys -t $RDN \"bash start.sh\" ENTER"
