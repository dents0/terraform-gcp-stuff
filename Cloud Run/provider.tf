terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.0.0"
        }
    }
}


provider "google" {
    project = var.project
    credentials = "${file("${var.path}\\terraform-key.json")}"
}
