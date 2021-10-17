variable "do_image" {
  type = string
}

variable "do_region" {
  type = string
}

variable "do_size" {
  type = string
}

variable "do_snapshot_regions" {
  type    = list(string)
  default = []
}

locals {
  do_droplet_name     = var.image_name
  do_snapshot_regions = concat([var.do_region], var.do_snapshot_regions)
}
