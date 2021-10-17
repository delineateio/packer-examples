packer {
  required_plugins {
    googlecompute = {
      version = "1.0.5"
      source  = "github.com/hashicorp/googlecompute"
    }
    digitalocean = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/digitalocean"
    }
  }
}

source "googlecompute" "image" {
  image_name          = var.image_name
  image_description   = "Disk created using Packer"
  skip_create_image   = var.gcp_skip_create_image
  project_id          = var.gcp_project_id
  source_image_family = var.gcp_source_image_family
  zone                = var.gcp_zone
  ssh_username        = "root"
  tags                = var.image_tags
  metadata = {
    enable-oslogin = "FALSE"
  }
}

source "digitalocean" "image" {
  snapshot_name    = var.image_name
  droplet_name     = local.do_droplet_name
  image            = var.do_image
  region           = var.do_region
  snapshot_regions = local.do_snapshot_regions
  size             = var.do_size
  monitoring       = true
  ssh_username     = "root"
  tags             = var.image_tags
}

build {
  sources = [
    "sources.googlecompute.image",
    "source.digitalocean.image"
  ]
}
