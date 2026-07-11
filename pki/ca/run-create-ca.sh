#!/bin/bash


D=ca

rm -fr $D

if [[ -d $D ]]; then
    echo "ca exists"
    exit 1
fi

mkdir -p $D

##   -aes-256-cbc \
( cd $D && openssl genpkey \
  -algorithm RSA \
  -pkeyopt rsa_keygen_bits:4096 \
  -out root-ca.key
)

( cd $D && openssl req \
  -x509 \
  -new \
  -sha256 \
  -days 3650 \
  -key root-ca.key \
  -out root-ca.crt \
  -subj "/C=DE/O=TEST/CN=Meine" \
  -addext "basicConstraints=critical,CA:TRUE,pathlen:0" \
  -addext "keyUsage=critical,keyCertSign,cRLSign" \
  -addext "subjectKeyIdentifier=hash"
)

( cd $D && openssl genpkey \
  -algorithm RSA \
  -pkeyopt rsa_keygen_bits:2048 \
  -out server.key
)

( cd $D && openssl req \
  -new \
  -sha256 \
  -key server.key \
  -out server.csr \
  -subj "/C=DE/O=Meine Infrastruktur/CN=syslog.internal"
)


cat > $D/server.ext <<'EOF'
basicConstraints = critical,CA:FALSE
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = serverAuth
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer

subjectAltName = @alt_names

[alt_names]
DNS.1 = syslog.internal
DNS.2 = rsyslog
IP.1 = 127.0.0.1
EOF

( cd $D && openssl x509 \
  -req \
  -sha256 \
  -days 825 \
  -in server.csr \
  -CA root-ca.crt \
  -CAkey root-ca.key \
  -CAcreateserial \
  -out server.crt \
  -extfile server.ext
)

( cd $D && openssl verify \
  -CAfile root-ca.crt \
  server.crt
)

(cd $D && openssl x509 \
  -in server.crt \
  -noout \
  -subject \
  -issuer \
  -dates \
  -ext subjectAltName \
  -ext basicConstraints \
  -ext extendedKeyUsage
)
