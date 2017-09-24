#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"
GOOGLE_CLUSTER_NAME="googlykubycluster"
AZURE_CLUSTER_PREFIX="bluekubycluster"

cd phase1
echo "Stage 1 Plan"
terraform init
terraform plan  \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$GOOGLE_CLUSTER_NAME \
    -var azure_cluster_prefix=$AZURE_CLUSTER_PREFIX

#cd ../phase2
#echo "Stage 2 Plan"
#terraform init
#terraform plan \
#    -var linux_admin_username=$CLUSTER_USERNAME \
#    -var linux_admin_password=$CLUSTER_PASSWORD \
#    -var cluster_name=$CLUSTER_NAME
