variable "path" {
    default = "PATH_TO_DIRECTORY"
}

provider "google" {
    project = "PROJECT_ID"
    region = "europe-west1"
    credentials = "${file("${var.path}\\terraform-key.json")}"
}
