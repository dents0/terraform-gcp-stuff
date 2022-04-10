variable "path" { default = "PATH_TO_DIRECTORY" }
variable "project_id" { default = "PROJECT_ID" }


provider "google" {
  project     = var.project_id
  region      = "europe-west2-a"
  credentials = file("${var.path}\\terraform-key.json")
}