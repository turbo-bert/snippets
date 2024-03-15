# remove lines after check /proc/asound/cards
## 
##  0 [NVidia         ]: HDA-Intel - HDA NVidia
##                       HDA NVidia at 0xfc080000 irq 127
##  1 [Generic        ]: HDA-Intel - HD-Audio Generic
##                       HD-Audio Generic at 0xfca00000 irq 129
##  2 [Device         ]: USB-Audio - USB PnP Sound Device
##                       C-Media Electronics Inc. USB PnP Sound Device at usb-0000:06:00.3-5, full speed
## 

cat /etc/asound.conf
echo -e "defaults.pcm.card 2\ndefaults.ctl.card 2" >/etc/asound.conf
