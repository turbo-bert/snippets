#!/bin/bash


hdiutil create -volname "$1" -srcfolder "$1.app" -ov "$1.dmg"
