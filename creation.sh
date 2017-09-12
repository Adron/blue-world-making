#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"

cd phase1
echo "Starting phase 1, Creat the Kubernetes Cluster."
terraform apply -var linux_admin_username=@CLUSTER_USERNAME -var linux_admin_password=@CLUSTER_PASSWORD

echo "Getting credentials and connection kubectl Proxy."

gcloud container clusters get-credentials kubyhouse --zone us-west1-a --project thrashingcorecode
echo "Verifying GCP Kubernetes Nodes."
kubectl get nodes

#az acs kubernetes get-credentials --resource-group kuberneteshouse --name kubecontainers
#echo "Verifying Azure Kubernetes Nodes."
#kubectl get nodes


sleep 2s
cd ..
echo "Phase 1 is completed."


kubectl config set-context gce --user=coolusername

#kubectl config set-context default-system \
#  --cluster=chosen-cluster \
#  --user=chosen-user
#
#kubectl config use-context default-system