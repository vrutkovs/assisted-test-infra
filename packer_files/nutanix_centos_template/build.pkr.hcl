packer {
  required_plugins {
    nutanix = {
      version = ">= 0.1.3"
      source  = "github.com/nutanix-cloud-native/nutanix"
    }
  }
}


build {
  sources = ["sources.nutanix.test-infra-template"]
}
