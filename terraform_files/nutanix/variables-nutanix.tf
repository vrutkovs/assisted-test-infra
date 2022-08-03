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
// Test infra variables
///////////


variable "cluster_name" {
  type = string
  description = <<EOF
AI cluster name
All the resources will be tagged with the cluster name
The resources should be associate with this name for easy recognition.
EOF
}

variable "iso_download_path" {
  type        = string
  description = "The ISO path (We have to upload this file to the vsphere)"
  default = ""
}

///////////
// Control Plane machine variables
///////////

variable "masters_count" {
  type = string
  default = "3"
  description = "The number of master nodes to be created."
}

variable "master_memory" {
  type = number
  default = 16984
  description = "The size of the master's virtual machine's memory, in MB"
}

variable "master_disk_size_gib" {
  type = number
  default = 120
  description = "The size of the master's disk, in GB"
}

variable "master_vcpu" {
  type = number
  default = 4
  description = "The total number of virtual processor cores to assign to the master virtual machine."
}

variable "workers_count" {
  type = string
  default = "2"
  description = "The number of worker nodes to be created."
}

variable "worker_memory" {
  type = number
  default = 16984
  description = "The size of the worker's virtual machine's memory, in MB"
}

variable "worker_disk_size_gib" {
  type = number
  default = 120
  description = "The size of the worker's disk, in GB"
}

variable "worker_vcpu" {
  type = number
  default = 4
  description = "The total number of virtual processor cores to assign to the master virtual machine."
}


variable "nutanix_cores_per_socket" {
  type = number
  default = 1
  description = <<EOF
The number of cores per socket(cpu) in this virtual machine.
The number of vCPUs on the virtual machine will be num_cpus divided by num_cores_per_socket.
If specified, the value supplied to num_cpus must be evenly divisible by this value. Default: 1
EOF
}
