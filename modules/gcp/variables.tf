variable "project" { type = string }
variable "region" { type = string }

variable "vpc_network_name" { type = string }
variable "vpc_subnetwork_name" { type = string }
variable "vpc_subnetwork_ip_cidr_range" { type = string }

variable "ce_app_zone" { type = string }

variable "ce_deploy_ssh_user" { type = string }
variable "ce_deploy_ssh_pub_key_path" { type = string }
