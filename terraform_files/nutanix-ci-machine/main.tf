terraform {
  required_providers {
    vsphere = {
      source = "nutanix/nutanix"
      version = "1.2.0"
    }
  }
}

provider "nutanix" {
  username     = var.nutanix_user
  password     = var.nutanix_password
  endpoint     = var.nutanix_endpoint
  wait_timeout = 60
}

locals {
  hasISO = var.iso_download_path != "" && var.iso_download_path != null
}

resource "nutanix_image" "image" {
  name = var.nutanix_image_name
}

data "nutanix_cluster" "cluster" {
  name = var.nutanix_cluster_name
}

data "nutanix_subnet" "subnet" {
  subnet_name = var.nutanix_subnet_name
}

# Create machine on nutanix
resource "nutanix_virtual_machine" "vm" {
  name                 = "assisted-ci-build-${var.build_id}"
  cluster_uuid         = data.nutanix_cluster.cluster.id
  num_vcpus_per_socket = var.vcpu
  num_sockets          = "1"
  memory_size_mib      = var.memory

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = var.nutanix_template_uuid
    }
  }

  disk_list {
    disk_size_bytes = var.disk_size * 1024 * 1024 * 1024
    device_properties {
      device_type = "DISK"
      disk_address = {
        "adapter_type" = "SCSI"
        "device_index" = "1"
      }
    }
  }

  nic_list {
    subnet_uuid = data.nutanix_subnet.subnet.id
  }
}
