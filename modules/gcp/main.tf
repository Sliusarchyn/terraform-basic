terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      configuration_aliases = [
        google
      ]
    }
  }
}

data "google_project" "project" {
  project_id = var.project
}
