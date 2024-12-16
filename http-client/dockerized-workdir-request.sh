#!/bin/bash





if [[ $1 = "__" ]]; then
    echo -n "Initialize and overwrite directory workdir? CTRL-C to abort"
    read

    rm -fr workdir
    mkdir workdir

    cat >workdir/http-client.env.json <<"EOF"
{
  "dev": {
    "host": "localhost"
  }
}
EOF
    
    cat >workdir/http-client.private.env.json <<"EOF"
{
  "dev": {
    "host": "localhost"
  }
}
EOF
    
    cat >workdir/request.http <<"EOF"
GET http://{{host}}:80/
Cookie: a=b; c=d

>>! output

> {%
 client.log(response.headers);
 %}
EOF
    

    exit 0
fi


e_value=${1:-dev}

docker run --rm -i -t -v $PWD/workdir:/workdir -e TERM=dumb \
    jetbrains/intellij-http-client \
    -e $e_value \
    -v http-client.env.json \
    -p http-client.private.env.json \
    -L VERBOSE \
    -D request.http 1>log.stdout_ansi 2>log.stderr_ansi

cat log.stdout_ansi | gsed -E 's/\x1b\[../\n/g' >log.stdout
cat log.stderr_ansi | gsed -E 's/\x1b\[../\n/g' >log.stderr
