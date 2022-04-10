variable "tier" { default = "db-n1-standard-1" }
variable "name" { default = "test-db" }
variable "db_region" { default = "europe-west2" }
variable "disk_size" { default = 15 }
variable "database_version" { default = "MYSQL_5_7" }
variable "replication_type" { default = "ASYNCHRONOUS" }
variable "activation_policy" { default = "always" }
variable "user_host" { default = "%" }


# Admin:
variable "user1_name" { default = "admin" }
variable "user1_password" { default = "password" }


# DBA User:
variable "user2_name" { default = "dba-user" }
variable "user2_password" { default = "password" }
