#!/bin/bash



F=$(cat export_fingerprint_only.asc)

echo "---"
cat export_fingerprint_only.asc
echo "---"

read

cat export_fingerprint.asc >$F.info.asc
cat export_public.asc >$F.public.asc
cat export_secret.asc >$F.private.asc
