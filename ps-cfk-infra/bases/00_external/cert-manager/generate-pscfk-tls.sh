#!/usr/bin/env bash

CURR_PATH=$(pwd)
PSCFK_INFRA_PATH=$CURR_PATH/../../..
CERT_MANAGER_VERSION=1.12.3

echo ; "=== Deploy Cert-Manager manifests ==="; echo

kubectl apply -f "https://github.com/cert-manager/cert-manager/releases/download/v$CERT_MANAGER_VERSION/cert-manager.yaml"

echo ; "=== Sleeping 60s ==="; echo
sleep 60

echo ; "=== Kustomize build / deploy 1_init ==="; echo
kustomize build 1_init | kubectl apply -f -

echo ; "=== Sleeping 5s ==="; echo
sleep 5

echo; "Save ca-key-pair for potential future usage"; echo
kubectl get secret ca-key-pair -n cert-manager -o yaml > post_deploy_manifest_reuse/test/1_init/ca-key-pair.yml


echo ; "=== Kustomize build / deploy 2_crds ==="; echo
kustomize build 2_crds | kubectl apply -f -

echo ; "=== Sleeping 30s ==="; echo
sleep 30




kubectl get secret -n temp tls-admin1 -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-admin1.yml;
kubectl get secret -n temp tls-admin2 -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-admin2.yml;
kubectl get secret -n temp tls-c3 -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-c3.yml;
kubectl get secret -n temp tls-client -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-client.yml;
kubectl get secret -n temp tls-connect -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-connect.yml;
kubectl get secret -n temp tls-dev1 -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-dev1.yml;
kubectl get secret -n temp tls-dev2 -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-dev2.yml;
kubectl get secret -n temp tls-dev3 -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-dev3.yml;
kubectl get secret -n temp tls-kafka -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-kafka.yml;
kubectl get secret -n temp tls-kraft -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-kraft.yml;
kubectl get secret -n temp tls-krp -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-krp.yml;
kubectl get secret -n temp tls-ksql -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-ksql.yml;
kubectl get secret -n temp tls-mds -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-mds.yml;
kubectl get secret -n temp tls-nejra -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-nejra.yml;
kubectl get secret -n temp tls-nermin -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-nermin.yml;
kubectl get secret -n temp tls-niyi -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-niyi.yml;
kubectl get secret -n temp tls-sr -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-sr.yml;
kubectl get secret -n temp tls-zookeeper -o yaml > post_deploy_manifest_reuse/tls-secrets/tls-zookeeper.yml;

kubectl get secret tls-mds -n temp -o yaml | yq '.data."tls.key"' | base64 -d > /tmp/mds-tokenkeypair.txt
openssl rsa -in /tmp/mds-tokenkeypair.txt -pubout > /tmp/mds-publickey.txt
kubectl create secret generic mds-token --from-file=mdsPublicKey.pem=/tmp/mds-publickey.txt --from-file=mdsTokenKeyPair.pem=/tmp/mds-tokenkeypair.txt -o yaml --dry-run=client > post_deploy_manifest_reuse/mds-token.yml




# remove lines / clean manifests
cd post_deploy_manifest_reuse

find ./  -type f -exec sed -i '' -e '/creationTimestamp:/d' {} \;
find ./  -type f -exec sed -i '' -e '/resourceVersion:/d' {} \;
find ./  -type f -exec sed -i '' -e '/uid:/d' {} \;

cd tls-secrets

find ./  -type f -exec sed -i '' -e '/namespace:/d' {} \;
find ./  -type f -exec sed -i '' -e '/cert-manager.io/d' {} \;
find ./  -type f -exec sed -i '' -e '/labels:/d' {} \;
find ./  -type f -exec sed -i '' -e '/annotations:/d' {} \;


TLS_UPDATED_DIR=$(pwd)

cd $PSCFK_INFRA_PATH
cp "$TLS_UPDATED_DIR"/tls-zookeeper.yml bases/02_zookeeper

cp "$TLS_UPDATED_DIR"/tls-kafka.yml bases/03_kafka
cp "$TLS_UPDATED_DIR"/../mds-token.yml bases/03_kafka

cp "$TLS_UPDATED_DIR"/tls-sr.yml bases/04_sr

cp "$TLS_UPDATED_DIR"/tls-connect.yml bases/05_connect

cp "$TLS_UPDATED_DIR"/tls-krp.yml bases/06_krp

cp "$TLS_UPDATED_DIR"/tls-ksql.yml bases/07_ksql

cp "$TLS_UPDATED_DIR"/tls-c3.yml bases/08_c3

cp "$TLS_UPDATED_DIR"/tls-kraft.yml bases/11_kraft

cp "$TLS_UPDATED_DIR"/tls-admin1.yml bases/09_client_auth/tls/admins
cp "$TLS_UPDATED_DIR"/tls-admin2.yml bases/09_client_auth/tls/admins

cp "$TLS_UPDATED_DIR"/tls-client.yml bases/09_client_auth/tls/c3users
cp "$TLS_UPDATED_DIR"/tls-niyi.yml bases/09_client_auth/tls/c3users
cp "$TLS_UPDATED_DIR"/tls-nermin.yml bases/09_client_auth/tls/c3users

cp "$TLS_UPDATED_DIR"/tls-dev1.yml bases/09_client_auth/tls/devs
cp "$TLS_UPDATED_DIR"/tls-dev2.yml bases/09_client_auth/tls/devs
cp "$TLS_UPDATED_DIR"/tls-dev3.yml bases/09_client_auth/tls/devs

cp "$TLS_UPDATED_DIR"/tls-nejra.yml bases/09_client_auth/tls/readonlyusers




cd ../ps-cfk-app/workshop
./init.sh tls-admin1 admin1
./init.sh tls-admin2 admin2
./init.sh tls-client client
./init.sh tls-dev1 dev1
./init.sh tls-dev2 dev2
./init.sh tls-dev3 dev3
./init.sh tls-nejra nejra
./init.sh tls-nermin nermin
./init.sh tls-niyi niyi



