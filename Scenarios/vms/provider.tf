variable "path" {
    default = "PATH_TO_DIRECTORY"
}

provider "google" {
    project = "PROJECT_ID"
    region = "europe-west2"
    credentials = "${file("${var.path}\\terraform-key.json")}"
}
