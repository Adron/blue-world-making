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
