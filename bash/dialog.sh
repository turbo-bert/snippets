#!/bin/bash


exec 3>&1
X=$(dialog --menu "Question" 0 0 0 value1 decsription1 value2 description2 2>&1 1>&3)
Y=$?
exec 3>&-
