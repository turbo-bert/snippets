#!/bin/bash



ssh d1 "rm -fr /root/build"
scp setup-build.sh d1:/root
ssh d1 "bash setup-build.sh"
scp -r d1:~/build .
