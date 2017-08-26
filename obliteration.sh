#!/usr/bin/env bash

cd phase1
echo "Starting phase 1 destruction. Destroying the core infrastructure for Kubernetes."
printf 'yes' | terraform destroy

cd ..
echo "Phase 1 destruction is completed."
