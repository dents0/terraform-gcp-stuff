variable "image" { default = "debian-cloud/debian-9" }
variable "machine_type" { 
    type = map
    default = {
        "dev" = "f1-micro"
        "prod" = "production_box_wont_work"
    } 
}
variable "name_count" { default = ["server1", "server2", "server3"] }

provider "google" {
    project = "my-project"
    region = "us-central1"
    zone = "us-central1-c"
    # Credentials read from GOOGLE_APPLICATION_CREDENTIALS env variable
}

resource "google_compute_instance" "vm_instance" {
    count = "1"
    name = "terraform-instance-${count.index+1}-${var.name_count[count.index]}"
    machine_type = "${var.machine_type["dev"]}"

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

    # The VM will be provided only if/after "other_vm" is built.
    depends_on = [google_compute_instance.other_vm]
}


resource "google_compute_instance" "other_vm" {
    count = "1"
    name = "other-instance-${count.index+1}-${var.name_count[count.index]}"
    machine_type = "${var.machine_type["dev"]}"

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

    # # The VM will be provided only if/after "vm_instance" is built.
    # depends_on = [google_compute_instance.vm_instance]
}
