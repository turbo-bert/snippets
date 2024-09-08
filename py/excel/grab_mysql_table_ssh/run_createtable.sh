#!/bin/bash


if [[ ! -d db ]]; then

mkdir db

( cd db && osd mysql )

sleep 15

echo "CREATE DATABASE testdb;" | mysql -u root -p --password=foo123 -h 127.0.0.1 -P 33060
echo "CREATE TABLE test_table (id INTEGER AUTO_INCREMENT, name VARCHAR(80), PRIMARY KEY(id));" | mysql -u root -p --password=foo123 -h 127.0.0.1 -P 33060 testdb

for I in $(seq 1 100); do
    echo "INSERT INTO test_table (name) VALUES ('bla');" | mysql -u root -p --password=foo123 -h 127.0.0.1 -P 33060 testdb
done

fi
