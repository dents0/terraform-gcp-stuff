resource "google_compute_firewall" "allow_http" {
    name = "allow-http"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["80"] # Can be ["80", "443", etc...]
    }

    target_tags = ["allow-http"]
}

resource "google_compute_firewall" "allow_https" {
    name = "allow-https"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["443"] # Can be ["80", "443", etc...]
    }

    target_tags = ["allow-https"]
}