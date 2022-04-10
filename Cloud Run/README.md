## Deploying to Cloud Run

1.  Enable the following APIs in your project:

    -   Cloud Run API [`run.googleapis.com`]
    -   Cloud Build API [`cloudbuild.googleapis.com`]
    -   Artifact Registry API [`artifactregistry.googleapis.com`]

2.  Configure the values in `variables.tf`.

3.  Deploy to Cloud Run following the standard Terraform flow:

    ```
    terraform init
    ```

    ```
    terraform plan
    ```

    ```
    terraform apply
    ```

---

GCP documentation:

-   https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
