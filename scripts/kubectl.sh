#!/bin/sh
MASTER_HOST=188.166.0.132
CA_CERT=~/deis-demo/ansible/certs/ca.pem
ADMIN_KEY=~/deis-demo/ansible/certs/admin-key.pem
ADMIN_CERT=~/deis-demo/ansible/certs/admin.pem
if [ ! -f /usr/local/bin/kubectl ] ; then
  curl -O https://storage.googleapis.com/kubernetes-release/release/v1.2.3/bin/linux/amd64/kubectl
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/kubectl
fi
kubectl config set-cluster default-cluster --server=https://${MASTER_HOST} --certificate-authority=${CA_CERT}
kubectl config set-credentials default-admin --certificate-authority=${CA_CERT} --client-key=${ADMIN_KEY} --client-certificate=${ADMIN_CERT}
kubectl config set-context default-system --cluster=default-cluster --user=default-admin
kubectl config use-context default-system
kubectl create -f scripts/dns-addon.yml
kubectl get nodes
