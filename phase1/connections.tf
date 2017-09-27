variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "aws_region" {}
variable "gcp_project" {}

gcp_project = "thrashingcorecode"

provider "google" {
  credentials = "${file("../../secrets/account-thrashingcode.json")}"
  project     = "thrashingcorecode"
  region      = "us-west1"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

provider "aws" {}

terraform {
  backend "gcs" {
    bucket  = "blue-world-terraform-state"
    path    = "terraform.tfstate"
    project = "thrashingcorecode"
  }
}
