#!/bin/bash




ISOO=cd.iso

if [[ -z $1 ]]; then
    echo "$(basename $0) <SRCDIR> <OUT.iso>"
    exit 0
fi


if [[ ! -z $1 ]]; then
    D=$1
fi

if [[ ! -z $2 ]]; then
    ISOO=$2
fi


rm -f $ISOO

hdiutil makehybrid \
  -iso \
  -udf \
  -joliet \
  -default-volume-name "DataCD" \
  -o $ISOO \
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

# virsh domblklist wintest --details | tr -s ' ' | grep -i cdrom | xargs | cut -d ' ' -f 3,4
