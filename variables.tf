variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

# Ubuntu LTS image family
variable "image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

# For metadata.ssh-keys
variable "ssh_user" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "credentials_path" {
  type = string
}
