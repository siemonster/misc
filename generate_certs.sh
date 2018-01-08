#/bin/bash
openssl genrsa -out server.key 2048
openssl req -new -out server.csr -key server.key -config openssl.cnf
openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt -extensions v3_req -extfile openssl.cnf
openssl pkcs12 -export -out keyStore.p12 -inkey server.key -in server.crt
