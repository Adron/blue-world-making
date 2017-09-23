resource "google_storage_bucket" "blue-world-tf-state" {
  name     = "blue-world-terraform-state"
  location = "us-west1"
}
