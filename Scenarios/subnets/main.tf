resource "google_compute_network" "network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "terraform_subnet_1" {
    name = "terraform-subnet1"
    ip_cidr_range = "10.3.0.0/16"
    region = "europe-west2"
    network = google_compute_network.network.self_link
}


resource "google_compute_subnetwork" "terraform_subnet_2" {
    name = "terraform-subnet1"
    ip_cidr_range = "10.4.0.0/16"
    region = "europe-west1"
    network = google_compute_network.network.self_link
}


resource "google_compute_subnetwork" "terraform_subnet_3" {
    name = "terraform-subnet3"
    ip_cidr_range = "10.5.0.0/16"
    region = "europe-west4"
    network = google_compute_network.network.self_link
}
