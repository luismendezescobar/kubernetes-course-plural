resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false  
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
}


/************firewall rule creation*************************************/

resource "google_compute_firewall" "ssh" {
  name    = "sh-allow"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges="0.0.0.0/0"
}

resource "google_compute_firewall" "allow-all-between-kubernetes-cluster" {
  name    = "all-allow"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
  } 
  allow {
    protocol = "udp"
  }  
  source_service_accounts = var.computer_account
  target_service_accounts = var.computer_account
}





