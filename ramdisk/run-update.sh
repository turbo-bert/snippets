#!/bin/bash


H=werkstatt
RDN=custom-ramdisk

rsync -avP --delete deploy $H:/$RDN/deploy
