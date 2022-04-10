resource "google_compute_firewall" "allow_ssh" {
    name = "allow-ssh"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["22"]
    }

    target_tags = ["allow-ssh"]
}
