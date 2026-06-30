#!/bin/bash




D=./tmpcdcontent

rm -f cd.iso

if [[ -d $D ]]; then
    echo "dir already there $D"
    exit 1
fi

mkdir -p $D

for I in "$@"; do

echo "__ $I __"

if [[ -f $I ]]; then
    cp -a $I $D
fi


done



hdiutil makehybrid \
  -iso \
  -udf \
  -joliet \
  -default-volume-name "CompactDisc" \
  -o cd.iso \
  $D





# virsh domblklist wintest
#
# root@homer:~# virsh domblklist wintest
#  Target   Source
# -----------------------------------------------------
#  sdb      //win.iso
#  sdc      /var/lib/libvirt/images/wintest.sda.qcow2

# virsh change-media wintest sdb --eject

# virsh change-media wintest sdb /tmp/cd.iso --insert

# virsh change-media wintest sdb /tmp/cd2.iso --update
