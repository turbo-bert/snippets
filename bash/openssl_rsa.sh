#!/bin/bash


#openssl base64 -d -in BASE64SIGFILE -out BINSIG
#openssl base64 -e -in bla -out bla64


openssl genrsa 8192 >key_8k
openssl rsa -in key_8k -pubout >pubout

dd if=/dev/urandom of=./srcdata bs=1M count=1
openssl dgst -sha256 -sign key_8k -out srcdata.sig srcdata
openssl dgst -verify pubout -keyform PEM -sha256 -signature srcdata.sig srcdata 1>/dev/null 2>/dev/null
ec=$?

if [[ $ec = 0 ]]; then
    echo sig ok
else
    echo sig failed
fi
