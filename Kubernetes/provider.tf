variable "path" {
    default = "PATH_TO_DIRECTORY"
}

provider "google" {
    project = "PROJECT_ID"
    region = "europe-west2-a"
    credentials = "${file("${var.path}\\terraform-key.json")}"
}


provider "google-beta" {
    project = "PROJECT_ID"
    region = "europe-west2-a"
    credentials = "${file("${var.path}\\terraform-key.json")}"
}


# # google_client_config and kubernetes provider must be explicitly specified like the following.
# data "google_client_config" "default" {}

# provider "kubernetes" {
#     host                   = "https://${module.gke.endpoint}"
#     token                  = data.google_client_config.default.access_token
#     cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }