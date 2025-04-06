terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.78.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.default_region
  zone    = var.default_zone
}

module "gcp" {
  source = "./modules/gcp"
  providers = {
    google = google
  }

  project = var.project
  region  = var.default_region

  vpc_network_name             = var.vpc_network_name
  vpc_subnetwork_name          = var.vpc_subnetwork_name
  vpc_subnetwork_ip_cidr_range = var.vpc_subnetwork_ip_cidr_range

  ce_app_zone                = var.default_zone
  ce_deploy_ssh_user         = var.deploy_ssh_user
  ce_deploy_ssh_pub_key_path = var.deploy_ssh_pub_key_path
}
