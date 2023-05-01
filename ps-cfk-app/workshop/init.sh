#!/usr/bin/env zsh

#set -n




extract_credentials() {
  secret=$1
  folder=$2
  kubectl get secret "$secret" -o yaml | yq '.data."tls.crt"' | base64 -d > "$folder"/pem/fullchain.pem
  kubectl get secret "$secret" -o yaml | yq '.data."tls.key"' | base64 -d > "$folder"/pem/privkey.pem
  kubectl get secret "$secret" -o yaml | yq '.data."ca.crt"' | base64 -d > "$folder"/pem/cacert.pem
  kubectl get secret "$secret" -o yaml | yq '.data."keystore.jks"' | base64 -d > "$folder"/keystore.jks
  kubectl get secret "$secret" -o yaml | yq '.data."truststore.jks"' | base64 -d > "$folder"/truststore.jks
}


extract_principal_mtls_sasl_ssl_credentials() {
  secret=$1
  folder=$2

  mkdir -p "$folder/pem"
  extract_credentials $secret $folder
}


#extract_principal_mtls_sasl_ssl_credentials tls-nermin nermin

#extract_principal_mtls_sasl_ssl_credentials tls-nejra nejra


extract_principal_mtls_sasl_ssl_credentials "$1" $2

