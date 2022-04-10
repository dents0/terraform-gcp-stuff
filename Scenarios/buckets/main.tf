resource "google_storage_bucket" "coldline_bucket" {
    name = "my-bckt"
    storage_class = "COLDLINE"
    location = "europe-west1"

    versioning {
        enabled = false
    }
}