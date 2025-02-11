#!/bin/bash

if [[ ! -f .sql ]]; then
    cat <<"EOF"
echo -en "SQLTXT_USER=foo\nSQLTXT_PW=bar\n" >.sql
EOF
    exit 1
fi

. .sql

mymysql() {
    mysql --batch -u "$SQLTXT_USER" -p --password="$SQLTXT_PW -h 127.0.0.1 -P 3306"
}


for F in $(ls sql_*.txt); do
    echo "Running [$F]"
    mymysql >$F.tsv <$F
done
