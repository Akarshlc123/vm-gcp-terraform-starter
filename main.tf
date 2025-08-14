provider "google" {
  credentials = file(var.credentials_path)
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Optional: default VPC for quick start (auto mode)
resource "google_compute_network" "default" {
  name  = "${var.name_prefix}-vpc"
  auto_create_subnetworks = true
}

# Allow SSH from anywhere (adjust for security)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.name_prefix}-allow-ssh"
  network = google_compute_network.default.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# VM instance
resource "google_compute_instance" "vm" {
  name         = "${var.name_prefix}-vm"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = 20
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = google_compute_network.default.name
    access_config {} # ephemeral public IP
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
