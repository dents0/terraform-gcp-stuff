resource "google_compute_instance" "vm_instance" {
    name = "ubuntu-instance"
    machine_type = var.machine_type
    zone = var.zone
    can_ip_forward = false
    description = "My Ubuntu VM"

    tags = ["allow-ssh"]

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-1804-lts"
            size = 10
        }
    }

    network_interface {
        # A default network is created for all GCP projects
        network = "default"
        access_config {
        }
    }

    service_account {
        # GCE VM's Cloud API access scopes
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}
