output "ci_cd_sa_credentials_key" {
  value = google_service_account_key.ci_cd_sa_key.private_key
}

output "app_ipv4_address" {
  description = "The external IP address of the gateway instance"
  value       = google_compute_address.public_ipv4.address
}
