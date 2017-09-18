#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"
CLUSTER_NAME="kubyhouse"

cd phase1
echo "Starting phase 1, Creat the Kubernetes Cluster."
echo "terraform apply -var linux_admin_username=$CLUSTER_USERNAME -var linux_admin_password=$CLUSTER_PASSWORD"
terraform apply \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$CLUSTER_NAME

echo "Now use `gcloud container clusters get-credentials kubyhouse --zone us-west1-a --project thrashingcorecode` to connect."
gcloud container clusters get-credentials kubyhouse --zone us-west1-a --project thrashingcorecode

echo "Setting proxy up."
kubectl proxy &

#az acs kubernetes get-credentials --resource-group kuberneteshouse --name kubecontainers
#echo "Verifying Azure Kubernetes Nodes."
#kubectl get nodes

sleep 2s
echo "Phase 1 is completed."
cd ../phase2

kubectl config set-context thrashingcorecode \
 --cluster=$CLUSTER_NAME \
 --user=$CLUSTER_USERNAME

kubectl config use-context

terraform apply
