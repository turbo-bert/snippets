#!/bin/bash


cp /System/Library/Fonts/Supplemental/*DIN*Alter*.ttf .

O=admininstallfonts.bat

X="$(ls *.ttf)"
XX=${X%%.ttf}

echo "///$X///"

cat >$O <<EOF
rem Run this in elevated shell
copy "$X" "%WINDIR%\Fonts"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "$XX (TrueType)" /t REG_SZ /d "$X" /f
EOF
