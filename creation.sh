#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"
GOOGLE_CLUSTER_NAME="googlykubycluster"
AZURE_CLUSTER_PREFIX="bluekubycluster"
REPO_NAME=""

echo "Initializing state location."

cd state_init
./init_state_storage.sh

echo "Getting confirmed configuration state file location."
while IFS='' read -r line || [[ -n "$line" ]]; do
    REPO_NAME=$line
done < "$FILE"

cd ../phase1

echo "Terraform init for provider dependencies."

terraform init \
    -backend-config="address=$REPO_NAME" \
    -backend-config="path=phase1/terraform.tfstate"

echo "Starting phase 1, Create the Kubernetes Cluster."
echo "terraform destroy \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$GOOGLE_CLUSTER_NAME \
    -var azure_cluster_prefix=$AZURE_CLUSTER_PREFIX \
    -var repo_name=$REPO_NAME"
terraform apply \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$GOOGLE_CLUSTER_NAME \
    -var azure_cluster_prefix=$AZURE_CLUSTER_PREFIX \
    -var repo_name=$REPO_NAME

echo "Now use `gcloud container clusters get-credentials $GOOGLE_CLUSTER_NAME --zone us-west1-a --project thrashingcorecode` to connect."
gcloud container clusters get-credentials $GOOGLE_CLUSTER_NAME --zone us-west1-a --project thrashingcorecode

echo "Setting proxy up."
kubectl proxy &

#az acs kubernetes get-credentials --resource-group kuberneteshouse --name kubecontainers
#echo "Verifying Azure Kubernetes Nodes."
#kubectl get nodes
echo "Phase 1 is completed."
sleep 2s
echo "Phase 2 is starting."
cd ../phase2


#echo "Terraform init for provider dependencies."
#terraform init
#
#echo "Running `kubectl config set-context thrashingcorecode --cluster=$CLUSTER_NAME --user=$CLUSTER_USERNAME` for kubectl context."
#kubectl config set-context thrashingcorecode \
# --cluster=$CLUSTER_NAME \
# --user=$CLUSTER_USERNAME
#
#echo "Config set to use-context."
#kubectl config use-context
#
#terraform apply
