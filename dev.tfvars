project        = "alex-cloud-run-app"
default_region = "us-central1"
default_zone   = "us-central1-a"

vpc_network_name             = "app-vpc"
vpc_subnetwork_name          = "app-subnetwork"
vpc_subnetwork_ip_cidr_range = "172.16.0.0/16"

deploy_ssh_user     = "deploy"
deploy_ssh_pub_key_path = "~/.ssh/deploy.pub"
