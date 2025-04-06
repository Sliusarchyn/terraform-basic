#deploy-sa
resource "google_service_account" "ci_cd_sa" {
  account_id   = "ci-cd-sa"
  display_name = "Deploy Service Account"
}

resource "google_project_iam_member" "ci_cd_sa_tunnel_resource_accessor_role" {
  project = var.project
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "serviceAccount:${google_service_account.ci_cd_sa.email}"
}

resource "google_service_account_key" "ci_cd_sa_key" {
  service_account_id = google_service_account.ci_cd_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

#logging-writer-for-compute-engine
resource "google_service_account" "ce_logging_and_metrics_writer_sa" {
  account_id   = "ce-logging-writer"
  display_name = "Compute-Engine-Log-Writer Service Account"
}

resource "google_project_iam_member" "ce_metrics_writer" {
  project = var.project
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.ce_logging_and_metrics_writer_sa.email}"
}

resource "google_project_iam_member" "ce_logging_writer" {
  project = var.project
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.ce_logging_and_metrics_writer_sa.email}"
}
