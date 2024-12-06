#!/bin/bash


GH="`pwd`/ghome"

exec gpg --homedir "$GH" "$@"
