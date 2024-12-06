#!/bin/bash


rm -fr ghome
mkdir ghome
GH="`pwd`/ghome"
chmod og-rwx "$GH"



echo " >>> $GH <<<"

gpg --homedir "$GH" --batch --no-tty --gen-key <<EOF
Key-Type: default
Key-Curve: Ed25519
Subkey-Type: default
Subkey-Curve: Ed25519
Name-Real: test
Name-Email: test@turbobert.de
Expire-Date: 0
%no-protection
%commit
EOF

#Key-Length: 2048
#Subkey-Length: 2048
