#!/usr/bin/env bash

cd phase1
echo "Starting phase 1, Creat the Kubernetes Cluster."
terraform apply

cd ..
echo "Phase 1 is completed."

