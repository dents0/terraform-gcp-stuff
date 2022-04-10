resource "google_service_account" "service_account" {
    count        = 5
    account_id   = "terraform-test-${count.index + 1}"
    display_name = "Service Account ${count.index + 1}"
}