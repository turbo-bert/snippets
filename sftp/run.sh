#!/bin/bash


# tested: LTS24

# host where to run
H=d2

U1="robert"
U1P="foo1234"
U1K=""

# base directroy on that host
B=/srv/some/sftp_root

# group
G=sftpusers



#####
U="bobsel"
UP="romrom"
UK=""

#####


SCRIPT_MODE="init"
SCRIPT_MODE=add

if [[ $SCRIPT_MODE == init ]]; then

    ssh $H "cat /etc/ssh/sshd_config | grep -v 'sftp-server' > /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '\\nSubsystem sftp internal-sftp\\n\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '\\nMatch Group $G\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '    ChrootDirectory $B/%u\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '    ForceCommand internal-sftp -u 022\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '    X11Forwarding no\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '    AllowTcpForwarding no\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '    PermitTunnel no\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "echo -en '    GatewayPorts no\\n' >> /etc/ssh/sshd_config.NEWNEW"
    ssh $H "cat /etc/ssh/sshd_config > /etc/ssh/sshd_config.OLDOLD"
    ssh $H "cat /etc/ssh/sshd_config.NEWNEW > /etc/ssh/sshd_config"
    ssh $H "sed -i 's/^PasswordAuthentication no.*//g' /etc/ssh/sshd_config.d/50-cloud-init.conf"
    ssh $H "systemctl restart ssh"

    ssh $H "sudo mkdir -p $B"
    ssh $H "sudo groupadd --force $G"

    U="$U1"
    UP="$U1P"
    UK="$U1K"


    ssh $H "sudo useradd -m -G $G -s /usr/sbin/nologin $U"
    ssh $H "sudo mkdir -p $B/$U/uploads"
    ssh $H "sudo chown root:root $B/$U"
    ssh $H "sudo chmod 755 $B/$U"
    ssh $H "sudo chown $U:$U $B/$U/uploads"
    ssh $H "sudo chmod 750 $B/$U/uploads"

    set -x
    ssh $H "echo $U:$UP | chpasswd"

fi


if [[ $SCRIPT_MODE == add ]]; then
    ssh $H "sudo useradd -m -G $G -s /usr/sbin/nologin $U"
    ssh $H "sudo mkdir -p $B/$U/uploads"
    ssh $H "sudo chown root:root $B/$U"
    ssh $H "sudo chmod 755 $B/$U"
    ssh $H "sudo chown $U:$U $B/$U/uploads"
    ssh $H "sudo chmod 750 $B/$U/uploads"
    ssh $H "echo $U:$UP | chpasswd"
fi
