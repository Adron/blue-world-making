#!/usr/bin/env bash

cd phase1
echo "Starting phase 1, Creat the Kubernetes Cluster."
terraform apply

echo "Getting credentials and connection kubectl Proxy."

gcloud container clusters get-credentials kubyhouse --zone us-west1-a --project thrashingcorecode
kubectl get nodes

az acs kubernetes get-credentials --resource-group kuberneteshouse --name kubecontainers
kubectl get nodes


sleep 2s
cd ..
echo "Phase 1 is completed."


kubectl config set-context gce --user=cluster-admin

#kubectl config set-context default-system \
#  --cluster=chosen-cluster \
#  --user=chosen-user
#
#kubectl config use-context default-system