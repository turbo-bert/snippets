#!/bin/bash


H=werkstatt
RDN=custom-ramdisk

rrsync -avP --delete deploy $H:/$RDN
