#!/bin/bash


while true; do

curl --limit-rate 4500k -C - -L -o 'ubuntu-24.04.1-live-server-amd64.iso' 'https://releases.ubuntu.com/noble/ubuntu-24.04.1-live-server-amd64.iso'

sleep 3

done
