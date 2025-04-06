resource "google_compute_instance" "app" {
  allow_stopping_for_update = true
  name                      = "app"
  machine_type              = "e2-micro"
  zone                      = var.ce_app_zone
  tags = ["allow-ssh", "allow-http-80", "allow-https-443"]

  metadata = {
    ssh-keys = "${var.ce_deploy_ssh_user}:${file(var.ce_deploy_ssh_pub_key_path)}"
  }

  service_account {
    email = google_service_account.ce_logging_and_metrics_writer_sa.email
    scopes = ["cloud-platform"]
  }

  boot_disk {
    initialize_params {
      size  = "25"
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_address.app_local_ipv4.subnetwork
    network_ip = google_compute_address.app_local_ipv4.address

    access_config {
      nat_ip       = google_compute_address.public_ipv4.address
      network_tier = google_compute_address.public_ipv4.network_tier
    }
  }
}
