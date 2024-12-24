#!/bin/bash



# mount crypted disk from loop file

set -x

# find free loop dev
LDEV=$(losetup -f)

echo "========================"
echo "$LDEV"
echo "========================"


LMP="$(pwd)/mp"


CNAME="test0"

if [[ -d "$LMP" ]]; then
    echo local mount point exists already
    exit 1
fi

mkdir -p "$LMP"

fallocate -l 100M $CNAME.img


losetup $LDEV $CNAME.img

sleep 1

cryptsetup luksFormat $LDEV

sleep 1

cryptsetup luksOpen $LDEV $CNAME

sleep 1

D=/dev/mapper/$CNAME
#mkfs.ext4 /dev/mapper/test0

mkfs.ext4 $D

mount $D $LMP


# umount $LMP
# cryptsetup luksClose $CNAME
# losetup -D
