#!/usr/bin/env bash

DT=`date '+%d%m%Y%H%M%S'`
REPO_NAME="terraformstate$DT"
RESULTS=""

echo "Start: `date '+%d-%m-%Y %H:%M:%S'`"

if [ -z "$1" ]; then
  echo "Creating Terraform state " $REPO_NAME " repo."
else
  $REPO_NAME=$1
  echo "Creating Terraform state " $REPO_NAME " repo."
fi



terraform init

echo "terraform apply -var=\"$REPO_NAME\""

terraform apply \
  -var repo_name=$REPO_NAME

echo "Writing blue-world-making state file."

# Eventually will put together full config file.
RESULTS="$REPO_NAME"
printf "$RESULTS" <../>../cross-phase-configuration

echo "Stop: `date '+%d-%m-%Y %H:%M:%S'`"
