#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"
CLUSTER_NAME="kubyhouse"

cd phase1
echo "Stage 1 Plan"
terraform init
terraform plan  \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$CLUSTER_NAME

cd ../phase2
echo "Stage 2 Plan"
terraform init
terraform plan \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$CLUSTER_NAME
