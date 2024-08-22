#!/bin/bash


A=$(cat N)

pushd $A
open $A.app
popd
