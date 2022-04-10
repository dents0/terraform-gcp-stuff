resource "google_compute_instance" "vm_instance" {
    count = 1
    name = "terraform-instance-${count.index+1}-${var.name_count[count.index]}"
    machine_type = "${var.machine_type["dev"]}"
    zone = var.zone
    can_ip_forward = "false"
    description = "This is my Virtual Machine"

    tags = ["allow-http", "allow-https"] # FIREWALL

    boot_disk {
        initialize_params {
            image = var.image
            size = "20"
        }
    }

    labels = {
        "name" = "terraform-instance-${count.index+1}-${var.name_count[count.index]}"
        "machine_type" = "${var.machine_type["dev"]}"
    }

    network_interface {
        # A default network is created for all GCP projects
        network = "default"
    }

    metadata = {
        "size" = "20"
        "foo" = "bar"
    }

    # metadata_startup_script = "../script.sh"
    metadata_startup_script = "echo hi > /test.txt"

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}

# Creating another boot disk
resource "google_compute_disk" "default" {
    name = "test-desk"
    type = "pd-ssd"
    size = "10"
}

# Attaching an additional disk
resource "google_compute_attached_disk" "default" {
    disk = "${google_compute_disk.default.self_link}"
    instance = "${google_compute_instance.vm_instance[0].self_link}"
}


# ========= OUTPUTS =========
output "machine_type" { value = "${google_compute_instance.vm_instance.*.machine_type}" }
output "name" { value = google_compute_instance.vm_instance.*.name }
output "zone" { value = google_compute_instance.vm_instance.*.zone }
output "instance_id" {
    # join(delim, list)"
    value = "${join(",", google_compute_instance.vm_instance.*.id)}"
}
output "lst" { value = var.lst }
output "pets" { value = var.pets }

