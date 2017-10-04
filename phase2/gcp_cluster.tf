//resource "kubernetes_namespace" "gcp-dev-workspace" {
//  metadata {
//    name = "dev-workspace"
//  }
//}
//
//resource "kubernetes_service" "gcp-example" {
//  metadata {
//    name = "terraform-example"
//  }
//  spec {
//    selector {
//      app = "${kubernetes_pod.example.metadata.0.labels.app}"
//    }
//    session_affinity = "ClientIP"
//    port {
//      port = 8080
//      target_port = 80
//    }
//
//    type = "LoadBalancer"
//  }
//}
//
//resource "kubernetes_pod" "example" {
//  metadata {
//    name = "terraform-example"
//    labels {
//      app = "MyApp"
//    }
//  }
//
//  spec {
//    container {
//      image = "nginx:1.7.9"
//      name  = "example"
//    }
//  }
//}
