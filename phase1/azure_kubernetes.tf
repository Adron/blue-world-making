//resource "azurerm_container_service" "kubyhousecontainers" {
//  name                   = "kubecontainers"
//  location               = "${azurerm_resource_group.kubernetes_house.location}"
//  resource_group_name    = "${azurerm_resource_group.kubernetes_house.name}"
//  orchestration_platform = "Kubernetes"
//
//  master_profile {
//    count      = 1
//    dns_prefix = "kubyhouse"
//  }
//
//  linux_profile {
//    admin_username = "${var.linux_admin_username}"
//
//    ssh_key {
//      key_data = "${var.azure_ssh_key}"
//    }
//  }
//
//  agent_pool_profile {
//    name       = "default"
//    count      = "${var.azure_cluster_count}"
//    dns_prefix = "kuby.house"
//    vm_size    = "Standard_A0"
//  }
//
//  service_principal {
//    client_id       = "${var.client_id}"
//    client_secret   = "${var.client_secret}"
//  }
//
//  diagnostics_profile {
//    enabled = false
//  }
//
//  tags {
//    Environment = "Production"
//  }
//}
