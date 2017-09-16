provider "kubernetes" {
  config_context_auth_info = ""
  config_context_cluster   = ""
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "default"
  }
}

