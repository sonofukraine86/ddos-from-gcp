variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Instance type"
}

variable "locations" {
  type        = list(string)
  default     = ["us-central1-a"]
  description = "Available GCP locations"
}

variable "os_type" {
  type        = string
#   default     = "debian-cloud/debian-9"
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
  description = "Operating system type"
}

variable "targets_file_url" {
  type    = string
  # default = "https://raw.githubusercontent.com/hem017/cytro/master/targets_all.txt"
  default = "https://raw.githubusercontent.com/sonofukraine86/ddos-from-gcp/master/targets.txt"
}

variable "proxy_file_url" {
  type    = string
  default = "http://143.244.166.15/proxy.list"
}

variable "sonofukraine_count" {
  type    = number
  default = 1
}

variable "ddoser_concurency" {
  type = string
  default = "500"
}

