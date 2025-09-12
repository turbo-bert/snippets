#!/bin/bash


for F in $(ls -1 *.lua | sort); do
echo "====== $F ========"
cat $F
echo "=================="
lua $F
echo "=================="
echo ""
done


echo -n RETURN
read
