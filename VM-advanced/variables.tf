variable "image" { default = "debian-cloud/debian-9" }
variable "machine_type" { 
    type = map
    default = {
        "dev" = "f1-micro"
        "prod" = "production_box_wont_work"
    } 
}
variable "zone" { default = "us-central1-c" }
variable "name_count" { default = ["server1", "server2", "server3"] }

variable lst { default = ["Cat", "Dog", "Fish"] }
variable pets { default = {for el in lst : el.species => el} }
