//////
// Nutanix variables
//////

variable "nutanix_username" {
  type = string
}

variable "nutanix_password" {
  type =  string
  sensitive = true
}

variable "nutanix_endpoint" {
  type = string
}

variable "nutanix_port" {
  type = number
}

variable "nutanix_insecure" {
  type = bool
  default = true
}

variable "nutanix_subnet_name" {
  type = string
}

variable "nutanix_cluster_name" {
  type = string
}

### Builder variables
variable "disk_size" {
  type = number
  default = 80
  description = "The VM disk size in GB. default 80G"
}

variable "memory_size" {
  type = string
  default = "16984"
  description = "The VM RAM size in MB. TODO: Adjust this variable to the right size"
}

variable "vcpus" {
  type = string
  default = "4"
  description = "The num of CPUs for this VM. TODO: Adjust this variable to the right size"
}

variable "centos_iso_image_name" {
  type = string
  default = "CentOS-Stream-8-x86_64-20220728"
  description = "The Centos8 ISO download URL"
}
