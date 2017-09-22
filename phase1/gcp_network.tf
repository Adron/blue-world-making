resource "google_compute_network" "kubynetwork" {
  name = "kubeynet"
  auto_create_subnetworks = "true"
}