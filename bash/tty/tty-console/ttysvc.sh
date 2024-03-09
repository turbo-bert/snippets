#!/bin/bash


mkdir -p /etc/systemd/system/getty@tty1.service.d
cat >/etc/systemd/system/getty@tty1.service.d/noclear.conf <<"EOF"
[Service]
TTYVTDisallocate=no
EOF

cat >/etc/systemd/system/getty@tty1.service.d/nologin.conf <<"EOF"
[Service]
ExecStartPre=/bin/sh -c 'setleds -D +num < /dev/%I'
ExecStart=
ExecStart=-/sbin/agetty --autologin root -l /usr/local/bin/my-getty.sh --noclear %I $TERM
EOF


if [[ ! -f /usr/local/bin/my-getty.sh ]]; then
    touch /usr/local/bin/my-getty.sh
    chmod a+x /usr/local/bin/my-getty.sh
    cat >/usr/local/bin/my-getty.sh <<"EOF"
#!/bin/bash

read X
echo $X >>/tmp/cmd-tty

EOF
fi
