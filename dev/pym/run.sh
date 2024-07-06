#!/bin/bash



# execute in your github base repo dir ***NOT INSIDE A REPO***
# project name will pe PROMPTED


D=`pwd`


echo "you are here [$D]"

echo -en "project name lowercase: "
read N


DSRC=$D/$N
DPYPI=$D/$N.pypi

if [[ -d $DSRC ]]; then
    echo "at least one dir exists already, aborting" 1>&2
    exit 1
fi

if [[ -d $DPYPI ]]; then
    echo "at least one dir exists already, aborting" 1>&2
    exit 1
fi

mkdir -p $DSRC/src/$N
( cd $DSRC/src/$N && tim )
echo -en "#!/bin/bash\n\n\nvp -m $N \"\$@\"\n" >$DSRC/src/run.sh
chmod a+x $DSRC/src/run.sh

mkdir -p $DSRC/build
echo -n "$N" >$DSRC/build/NAME
( cd $DSRC/build && ln -s ~/src/github/docker-extroverted/utils/pypi/publish.sh )

mkdir -p $DPYPI
( cd $DPYPI &&  ppprepper $N )





#rm -fr turbodbt.pypi
#rm -fr turbodbt
