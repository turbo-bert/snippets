#!/bin/bash



NAME="Bob"
ADDR="sinclair@turbobert.de"

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
Name-Real: $NAME
Name-Email: $ADDR
Expire-Date: 0
%no-protection
%commit
EOF

#Key-Length: 2048
#Subkey-Length: 2048

gpg --homedir "$GH" --batch --no-tty --export-secret-keys -a >export_secret.asc
gpg --homedir "$GH" --batch --no-tty --export -a >export_public.asc
gpg --homedir "$GH" --batch --no-tty --list-keys --fingerprint >export_fingerprint.asc
gpg --homedir "$GH" --batch --no-tty --list-keys --fingerprint | grep "^   " | head -1 | tr -d ' ' | tr -d '\n' >export_fingerprint_only.asc
