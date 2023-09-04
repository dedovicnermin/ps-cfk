`kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.3/cert-manager.yaml`
```
kustomize build bases/00_external/cert-manager/1_init | kubectl apply -f -
kustomize build bases/0_external/cert-manager/2_crds | kubectl apply -f -
```


## Creating mds-token
```
kubectl get secret tls-mds -o yaml | yq '.data."tls.key"' | base64 -d > /tmp/mds-tokenkeypair.txt
openssl rsa -in /tmp/mds-tokenkeypair.txt -pubout > /tmp/mds-publickey.txt
k create secret generic mds-token --from-file=mdsPublicKey.pem=/tmp/mds-publickey.txt --from-file=mdsTokenKeyPair.pem=/tmp/mds-tokenkeypair.txt --namespace confluent -o yaml --dry-run=client
```


`kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.3/cert-manager.yaml`