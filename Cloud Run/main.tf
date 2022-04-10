resource "google_cloud_run_service" "default" {
    name     = "hellorun-terraform"
    location = var.location

    template {
        spec {
            containers {
                image = var.docker-image
            }
        }
    }

    traffic {
        percent         = 100
        latest_revision = true
    }
}


# ===============================================
# =================== NO AUTH ===================
# ===============================================

data "google_iam_policy" "noauth" {
    binding {
        role = "roles/run.invoker"
        members = [
            "allUsers",
        ]
    }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
    location    = google_cloud_run_service.default.location
    project     = google_cloud_run_service.default.project
    service     = google_cloud_run_service.default.name

    policy_data = data.google_iam_policy.noauth.policy_data
}

# ===============================================
# ================= / NO AUTH ===================
# ===============================================
