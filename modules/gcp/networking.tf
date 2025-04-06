resource "google_compute_network" "app_vpc" {
  name                    = var.vpc_network_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "app_vpc" {
  name                     = var.vpc_subnetwork_name
  ip_cidr_range            = var.vpc_subnetwork_ip_cidr_range
  region                   = var.region
  private_ip_google_access = true
  network                  = google_compute_network.app_vpc.id
}

resource "google_compute_firewall" "allow_ssh" {
  name = "allow-ssh"
  allow {
    ports = ["22"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  network   = google_compute_network.app_vpc.id
  priority  = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-ssh"]
}

resource "google_compute_firewall" "allow_http_80" {
  name = "allow-http-80"
  allow {
    ports = ["80"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  network   = google_compute_network.app_vpc.id
  priority  = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http-80"]
}

resource "google_compute_firewall" "allow_https_443" {
  name = "allow-https-443"
  allow {
    ports = ["443"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  network   = google_compute_network.app_vpc.id
  priority  = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-https-443"]
}

resource "google_compute_firewall" "allow_http_3000" {
  name = "allow-http-3000"
  allow {
    ports = ["3000"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  network   = google_compute_network.app_vpc.id
  priority  = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http-3000"]
}
//-------Public IPs-------
resource "google_compute_address" "public_ipv4" {
  name         = "public-ipv4"
  region       = var.region
  address_type = "EXTERNAL"
  network_tier = "STANDARD"
}

//-------NAT-------
resource "google_compute_address" "nat_address" {
  name         = "nat-external-address-1"
  region       = google_compute_subnetwork.app_vpc.region
  address_type = "EXTERNAL"
  network_tier = "STANDARD"
}

resource "google_compute_router" "router" {
  name    = "${var.region}-router"
  region  = google_compute_subnetwork.app_vpc.region
  network = google_compute_network.app_vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.region}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips = [google_compute_address.nat_address.self_link]

  min_ports_per_vm                    = 64
  max_ports_per_vm                    = 65536
  enable_dynamic_port_allocation      = true
  enable_endpoint_independent_mapping = false
}

//-------Local IPs-------
resource "google_compute_address" "app_local_ipv4" {
  name         = "gateway-local-ipv4"
  subnetwork   = google_compute_subnetwork.app_vpc.self_link
  region       = var.region
  address_type = "INTERNAL"
  address      = "172.16.0.100"
}
