// General Variables
variable "linux_admin_username" {
  type        = "string"
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}

variable "linux_admin_password" {
  type ="string"
  description = "The password for the Linux admin account."
}

variable "ssh_key" {
  type = "string"
  description = "SSH Key for Kubernetes Clusters."
}

// AWS Variables
variable "aws_region" {}

// GCP Variables
variable "gcp_cluster_count" {
  type = "string"
  description = "Count of cluster instances to start."
}

variable "cluster_name" {
  type = "string"
  description = "Cluster name for the GCP Cluster."
}

// Azure Variables
variable "azure_node_count" {
  type = "string"
  description = "Count of cluster instances to start."
}

variable "azure_cluster_prefix" {
  type = "string"
  description = "The prefix for the Azure cluster."
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}


// GCP Outputs
output "gcp_cluster_endpoint" {
  value = "${google_container_cluster.googlykuby.endpoint}"
}

output "gcp_ssh_command" {
  value = "ssh ${var.linux_admin_username}@${google_container_cluster.googlykuby.endpoint}"
}

output "gcp_cluster_name" {
  value = "${google_container_cluster.googlykuby.name}"
}

// Azure Outputs
output "azure_master_dns_fqdn" {
  value = "${azurerm_container_service.bluekuby.master_profile.fqdn}"
}

output "azure_ssh_command" {
  value = "ssh ${var.linux_admin_username}@${azurerm_container_service.bluekuby.master_profile.fqdn} -A -p 22"
}
