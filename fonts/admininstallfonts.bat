rem Run this in elevated shell
copy "DIN Alternate Bold.ttf" "%WINDIR%\Fonts"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "DIN Alternate Bold (TrueType)" /t REG_SZ /d "DIN Alternate Bold.ttf" /f
