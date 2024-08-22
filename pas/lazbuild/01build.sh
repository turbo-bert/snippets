#!/bin/bash


A=$(cat N)

pushd $A
/Applications/Lazarus/lazbuild "$(ls *.lpi)"
popd
ls -al
