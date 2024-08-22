#!/bin/bash


A=$(cat N)

rm -fr $A/backup
rm -fr $A/lib
rm -f $A/$A
rm -fr $A/$A.app

rm -f general.zip $A-setup.zip $A-setup.zip.gpg
