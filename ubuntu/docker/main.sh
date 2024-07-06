#!/bin/bash



#https://docs.docker.com/engine/install/ubuntu/

apt purge docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc

apt install ca-certificates curl build-essential

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" >> /etc/apt/sources.list.d/docker.list




apt update

apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
