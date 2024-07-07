#!/bin/bash



RES_DEBIAN="unknown"
RES_PYPI="unknown"


N=$1

if [[ -z $N ]]; then
    echo -en "input: "
    read N
fi


# debian check

curl -s -o out -L "https://packages.debian.org/search?searchon=contents&keywords=$N&mode=exactfilename&suite=stable&arch=any"
cat out | grep -i "your search gave no results" 1>/dev/null 2>/dev/null
ec=$?

if [[ $ec = 0 ]]; then
    RES_DEBIAN="free"
else
    RES_DEBIAN="used"
fi

# pypi check

curl -s -o out_pypi -L "https://pypi.org/project/$N/"
cat out_pypi | grep -i "page not found" 1>/dev/null 2>/dev/null
ec=$?

if [[ $ec = 0 ]]; then
    RES_PYPI="free"
else
    RES_PYPI="used"
fi





set | grep ^RES_

echo ""
echo -en "Press RETURN to continue"
read
