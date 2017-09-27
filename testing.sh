
CLUSTER_USERNAME="coolusername"
CLUSTER_PASSWORD="coolpassword"
GOOGLE_CLUSTER_NAME="googlykubycluster"
AZURE_CLUSTER_PREFIX="bluekubycluster"

echo "Initializing state location."

cd state_init
./init_state_storage.sh

cd ../phase1

echo "Terraform init for provider dependencies."

terraform init \
    -backend-config="address=https://console.cloud.google.com/storage/browser/blue-world-terraform-state" \
    -backend-config="path=terraform.tfstate"

echo "Starting phase 1, Creat the Kubernetes Cluster."
echo "terraform plan -var linux_admin_username=$CLUSTER_USERNAME -var linux_admin_password=$CLUSTER_PASSWORD"
terraform plan \
    -var linux_admin_username=$CLUSTER_USERNAME \
    -var linux_admin_password=$CLUSTER_PASSWORD \
    -var cluster_name=$GOOGLE_CLUSTER_NAME \
    -var azure_cluster_prefix=$AZURE_CLUSTER_PREFIX
