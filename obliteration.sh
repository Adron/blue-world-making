#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"
CLUSTER_NAME="kubyhouse"

cd phase1

terraform init

echo "Starting phase 1 destruction. Destroying the core infrastructure for Kubernetes."

echo "terraform destroy \
-var linux_admin_username=$CLUSTER_USERNAME \
-var linux_admin_password=$CLUSTER_PASSWORD \
-var cluster_name=$CLUSTER_NAME"

terraform destroy \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$CLUSTER_NAME

#cd ..
#echo "Phase 1 destruction is completed."
