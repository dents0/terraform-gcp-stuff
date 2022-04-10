variable "path" {
    type = string
    description = "Path to the Service Account key that will be used by Terraform."
}

variable "project" {
    sensitive = true
    type = string
    description = "GCP project ID."
}

variable "location" {
    default = "europe-west3"
    description = "Cloud Run service location."
}

variable "docker-image" {
    sensitive = true
    type = string
    description = "Docker image located in Artifact Registry or Container Registry."
}
