resource "google_compute_network" "terraform-net" {
    name = "terraform-network"
    auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "terraform-subnet" {
    name = "terraform-subnet"
    ip_cidr_range = "10.2.0.0/16"
    region = "us-central1"
    network = google_compute_network.terraform-net.self_link
}
