#!/bin/bash



if [[ -z $1 ]]; then
    echo "Syntax: 1=server-host 2=server-port 3=consumer-host 4=temp-port"
    echo "Will create/overwrite [run_service.sh] and [run_consumer.sh] on success."
    exit 0
fi


SERVICEHOST="$1"
SERVICEPORT="$2"
CONSUMERHOST="$3"
CENTERPORT=18000


cat >run_service.sh <<EOF
#!/bin/bash

ssh -L 127.0.0.1:$CENTERPORT:127.0.0.1:$SERVICEPORT $SERVICEHOST

EOF

cat >run_consumer.sh <<EOF
#!/bin/bash

ssh -R 127.0.0.1:$SERVICEPORT:127.0.0.1:$CENTERPORT $CONSUMERHOST

EOF



chmod a+x run_service.sh
chmod a+x run_consumer.sh
