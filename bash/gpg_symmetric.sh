#!/bin/bash


uptime | gpg -c --batch --passphrase foo123 >bla.gpg
cat bla.gpg | gpg -d --batch --passphrase foo123 >bla.orig
