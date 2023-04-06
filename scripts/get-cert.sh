#!/bin/sh

SERVER=${1:-my.example.com}
PORT=${2:-143}
CERT_FOLDER=${3:-~/certs}

openssl s_client -starttls imap -connect ${SERVER}:${PORT} -showcerts 2>&1 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'| sed -ne '1,/-END CERTIFICATE-/p' > ${CERT_FOLDER}/${SERVER}.pem
