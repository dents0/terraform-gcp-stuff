variable "image" { default = "debian-cloud/debian-9" }
variable "machine_type" { 
    type = map
    default = {
        "dev" = "f1-micro"
        "prod" = "production_box_wont_work"
    } 
}
variable "name_count" { default = ["server1", "server2", "server3"] }

# Variables for the IF statement
variable "environment" { default = "development" }
variable "machine_type_prod" { default = "production_box_wont_work" }


provider "google" {
    project = "my-project"
    region = "us-central1"
    zone = "us-central1-c"
    # Credentials read from GOOGLE_APPLICATION_CREDENTIALS env variable
}

resource "google_compute_instance" "vm_instance" {
    count = "${length(var.name_count)}"
    name = "terraform-instance-${count.index+1}-${var.name_count[count.index]}"
    # CONDITION ? TRUE : FALSE
    machine_type = "${var.environment == "development" ? var.machine_type["dev"] : var.machine_type_prod}"
    boot_disk {
        initialize_params {
            image = var.image
        }
    }

    network_interface {
        # A default network is created for all GCP projects
        network = "default"
    }

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}


# ========= SINGLE OUTPUTS =========
# output "machine_type" { value = "${google_compute_instance.vm_instance.machine_type}" }
# output "name" { value = google_compute_instance.vm_instance.name }
# output "zone" { value = google_compute_instance.vm_instance.zone }
# output "image" { value = google_compute_instance.vm_instance.boot_disk[0].initialize_params[0].image }

output "machine_type" { value = "${google_compute_instance.vm_instance.*.machine_type}" }
output "name" { value = google_compute_instance.vm_instance.*.name }
output "zone" { value = google_compute_instance.vm_instance.*.zone }

output "instance_id" {
    # join(delim, list)"
    value = "${join(",", google_compute_instance.vm_instance.*.id)}"
}
