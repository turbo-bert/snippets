#!/bin/bash


mkdir workdir
cat >workdir/main.http <<EOF
GET https://www.google.de
EOF
cat >workdir/http-client.env.json <<EOF
{
        "development": {
          "public": "value"
        }
}
EOF
cat >workdir/http-client.private.env.json <<EOF
{
        "development": {
          "private": "value"
        }
}
EOF
echo -en "#!/bin/bash\n\n\ndocker run --rm -i -t -v \$PWD/workdir:/workdir jetbrains/intellij-http-client -e development -v http-client.env.json -p http-client.private.env.json -L VERBOSE -D main.http\n" >docker_run.sh
chmod a+x docker_run.sh
