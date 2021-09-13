#!/bin/bash

echo "**********"

echo "* Root CA"

openssl genrsa -out root-ca-key.pem 2048"

openssl req -days 3650 -new -x509 -sha256 -key root-ca-key.pem -out root-ca.pem -subj "/C=US/L=NY/O=IT/CN=root-ca"’

echo "**********"

echo "* Admin cert"

echo "create: admin-key-temp.pem"

openssl genrsa -out admin-key-temp.pem 2048

echo "create: admin-key.pem"

openssl pkcs8 -inform PEM -outform PEM -in admin-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out admin-key.pem

echo "create: admin.csr"

openssl req -days 3650 -new -key admin-key.pem -out admin.csr -subj "/C=US/L=NY/O=IT/CN=admin"

echo "create: admin.pem"

openssl x509 -req -days 3650 -in admin.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out admin.pem

echo "**********"

echo "* Node cert"

echo "create: node-key-temp.pem"

openssl genrsa -out node-key-temp.pem 2048

echo "create: node-key.pem"

openssl pkcs8 -inform PEM -outform PEM -in node-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node-key.pem

echo "create: node.csr"

openssl req -days 3650 -new -key node-key.pem -out node.csr -subj "/C=US/L=NY/O=IT/CN=*.elasticsearch"

echo "create: node.pem"

openssl x509 -req -days 3650 -in node.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node.pem

echo "**********"

echo "* Kibana cert"

echo "create: kibana-key-temp.pem"

openssl genrsa -out kibana-key-temp.pem 2048

echo "create: kibana-key.pem"

openssl pkcs8 -inform PEM -outform PEM -in kibana-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out kibana-key.pem

echo "create: kibana.csr"

openssl req -days 3650 -new -key kibana-key.pem -out kibana.csr -subj "/C=US/L=NY/O=IT/CN=kibana"

echo "create: kibana.pem"

openssl x509 -req -days 3650 -in kibana.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out kibana.pem

echo "*** End ***"