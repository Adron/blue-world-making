#!/usr/bin/env bash

CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"

cd phase1
echo "Starting phase 1 destruction. Destroying the core infrastructure for Kubernetes."
printf 'yes' | terraform destroy -var linux_admin_username=@CLUSTER_USERNAME -var linux_admin_password=@CLUSTER_PASSWORD

cd ..
echo "Phase 1 destruction is completed."

