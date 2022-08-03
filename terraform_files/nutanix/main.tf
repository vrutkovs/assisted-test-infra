terraform {
  required_providers {
    vsphere = {
      source = "nutanix/nutanix"
      version = "1.2.0"
    }
  }
}

locals {
  hasISO = var.iso_download_path != "" && var.iso_download_path != null
}

provider "nutanix" {
  username     = var.nutanix_user
  password     = var.nutanix_password
  endpoint     = var.nutanix_endpoint
  wait_timeout = 60
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

resource "nutanix_image" "test" {
  # upload the file only if exist
  count       = local.hasISO ? 1 : 0
  name        = "cluster-${var.cluster_name}-${basename(var.iso_download_path)}"
  image_type  = "ISO"
  source_path  = var.iso_download_path
}

resource "nutanix_virtual_machine" "vm" {
  count = var.masters_count

  name                 = "${var.cluster_name}-master-${count.index}"
  cluster_uuid         = data.nutanix_cluster.cluster.id
  num_vcpus_per_socket = var.master_vcpu
  num_sockets          = var.nutanix_cores_per_socket
  memory_size_mib      = var.master_memory

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = var.nutanix_template_uuid
    }
  }

  disk_list {
    disk_size_bytes = var.master_disk_size_gib * 1024 * 1024 * 1024
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

resource "nutanix_virtual_machine" "vm" {
  count = var.workers_count

  name                 = "${var.cluster_name}-worker-${count.index}"
  cluster_uuid         = data.nutanix_cluster.cluster.id
  num_vcpus_per_socket = var.worker_vcpu
  num_sockets          = var.nutanix_cores_per_socket
  memory_size_mib      = var.worker_memory

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = var.nutanix_template_uuid
    }
  }

  disk_list {
    disk_size_bytes = var.worker_disk_size_gib * 1024 * 1024 * 1024
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
