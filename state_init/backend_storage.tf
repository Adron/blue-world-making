resource "google_storage_bucket" "blue-world-tf-state" {
  name     = "${var.repo_name}"
  location = "us-west1"
}

resource "google_storage_bucket_acl" "image-store-acl" {
  bucket = "${google_storage_bucket.blue-world-tf-state.name}"
  predefined_acl = "publicreadwrite"
}
