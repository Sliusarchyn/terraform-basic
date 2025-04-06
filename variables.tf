#GCP
variable "project" { type = string }
variable "default_region" { type = string }
variable "default_zone" { type = string }

variable "vpc_network_name" { type = string }
variable "vpc_subnetwork_name" { type = string }
variable "vpc_subnetwork_ip_cidr_range" { type = string }

variable "deploy_ssh_user" { type = string }
variable "deploy_ssh_pub_key_path" { type = string }
