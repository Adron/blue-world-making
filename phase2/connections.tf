provider "kubernetes" {
}

terraform {
  backend "gcs" {
    bucket  = "blue-world-terraform-state"
    path    = "phase2/terraform.tfstate"
    project = "thrashingcorecode"
  }
}
