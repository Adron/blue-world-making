// Variables

variable "linux_admin_username" {
  type        = "string"
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}

variable "linux_admin_password" {
  type ="string"
  description = "The password for the Linux admin account."
}

variable "gcp_cluster_count" {
  type = "string"
  description = "Count of cluster instances to start."
}

variable "azure_cluster_count" {
  type = "string"
  description = "Count of cluster instances to start."
}

variable "azure_ssh_key" {
  type = "string"
  description = "SSH Key for the Azure Kubernetes Cluster."
}

// Outputs
//output "gcp_cluster_endpoint" {
//  value = "${google_container_cluster.primary.endpoint}"
//}
//
//output "gcp_ssh_command" {
//  value = "ssh ${var.linux_admin_username}@${google_container_cluster.primary.endpoint}"
//}
//
//output "azure_master_dns_fqdn" {
//  value = "${azurerm_container_service.kubyhousecontainers.master_profile.fqdn}"
//}
//
//output "azure_ssh_command" {
//  value = "ssh ${var.linux_admin_username}@${azurerm_container_service.kubyhousecontainers.master_profile.fqdn} -A -p 22"
//}
