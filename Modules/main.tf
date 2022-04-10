# ==============================================
# == Acts as an overwrite file for variables. ==
# ==============================================

module "instance" {
    source = "../VM-advanced"
    zone = "europe-west1-a"
    machine_type = {
        "dev" = "n1-standard-2"
        "prod" = "production_box_wont_work"
    }
}


module "instance_2" {
    source = "../VM-advanced"
    zone = "europe-west1-b"
    machine_type = {
        "dev" = "n1-standard-1"
        "prod" = "production_box_wont_work"
    }
}


module "bucket" {
    source = "../Buckets"
    bucket_name = "my-bckt"
}

