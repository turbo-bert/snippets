#!/bin/bash


rm -fr pi-gen

ls -al
read


#git clone https://github.com/RPi-Distro/pi-gen.git
git clone --branch arm64 https://github.com/RPi-Distro/pi-gen.git


touch pi-gen/stage3/SKIP
touch pi-gen/stage4/SKIP
touch pi-gen/stage5/SKIP

touch pi-gen/stage4/SKIP_IMAGES
touch pi-gen/stage5/SKIP_IMAGES

cat >pi-gen/config <<EOF
IMG_NAME=lernix
PI_GEN_RELEASE=lernix
#RELEASE
APT_PROXY=http://172.17.0.1:3142
DEPLOY_COMPRESSION=none
LOCALE_DEFAULT=de_DE.UTF-8
TARGET_HOSTNAME=oinksi
KEYBOARD_KEYMAP=de
KEYBOARD_LAYOUT=German
TIMEZONE_DEFAULT=Europe/Berlin
FIRST_USER_NAME=bob
ENABLE_SSH=1
PUBKEY_SSH_FIRST_USER='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5puwEpAQRqqpga+O85DSIj9gy1qeAepPWDqzroHfE9'
PUBKEY_ONLY_SSH=1
EOF



## 
## +++ apt-cacher.conf     2025-01-19 15:36:56.064284138 +0000
## +cache_dir = /var/cache/apt-cacher
## +log_dir = /var/log/apt-cacher
## +daemon_port = 3142
## +allowed_hosts = *
##
