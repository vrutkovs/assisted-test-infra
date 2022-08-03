source "nutanix" "test-infra-template" {
  image_name       ="assisted-test-infra-{{isotime `Jan-_2-15:04:05`}}"

  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_port     = var.nutanix_port
  nutanix_insecure = var.nutanix_insecure
  cluster_name     = var.nutanix_cluster_name
  os_type          = "Linux"

  # SSH
  ssh_password     = "packer"
  ssh_username     = "root"

  # Hardware Configuration
  cpu = var.vcpus
  memory_mb = var.memory_size

  # Shutdown Configuration
  shutdown_command = "shutdown -P now"

  cd_files          = ["centos-config/centos8-ks.cfg"]
  cd_label          = "OEMDRV"

  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = var.centos_iso_image_name
  }

  vm_disks {
      image_type = "DISK"
      disk_size_gb = var.disk_size
  }

  vm_nics {
    subnet_name       = var.nutanix_subnet_name
  }
}
