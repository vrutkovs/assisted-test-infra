//////
// Nutanix variables
//////

variable "nutanix_endpoint" {
  type        = string
  description = "Nutanix PrismElement endpoint"
}

variable "nutanix_user" {
  type        = string
  description = "Nutanix PrismElement username"
}

variable "nutanix_password" {
  type        = string
  description = "Nutanix PrismElement password"
}

variable "nutanix_cluster_name" {
  type        = string
  description = "Nutanix PrismElement cluster name"
}

variable "nutanix_subnet_name" {
  type        = string
  description = "Nutanix subnetwork name"
}

variable nutanix_image_name {
  type = string
  description = "The Fedora/Centos template name to clone, should exist on the Nutanix"
}

///////////
// Creating a vsphere machine to deploy test-infra on it.
///////////

variable "build_id" {
  type        = string
  description = "The CI build id"
}

variable "vcpu" {
  type = number
  default = 4
  description = "The total number of virtual processor cores to assign to the virtual machine."
}

variable "memory" {
  type = number
  default = 16984
  description = "The size of the virtual machine's memory, in MB"
}

variable "disk_size" {
  type = number
  default = 240
  description = "The size of the virtual machine's disk, in GB"
}

variable "domain" {
  type = string
  description = "The host domain name"
  default = "redhat.com"
}
