#!/bin/bash


mkdir -p /var/log/pcaps && dumpcap -i any -q -B 4096 -b duration:60 -w /var/log/pcaps/capture.pcapng
