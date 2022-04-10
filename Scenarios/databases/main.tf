# Create Database
resource "google_sql_database_instance" "gcp_database" {
    name = var.name
    region = var.db_region
    database_version = var.database_version
    deletion_protection = false

    settings {
        tier = var.tier
        disk_size = var.disk_size
        replication_type = var.replication_type
        activation_policy = var.activation_policy
    }
}


# Create Admin
resource "google_sql_user" "admin" {
    count = 1
    name = var.user1_name
    host = var.user_host
    password = var.user1_password
    instance = google_sql_database_instance.gcp_database.name
}


# Create DBA User
resource "google_sql_user" "dba_user" {
    count = 1
    name = var.user2_name
    host = var.user_host
    password = var.user2_password
    instance = google_sql_database_instance.gcp_database.name
}
