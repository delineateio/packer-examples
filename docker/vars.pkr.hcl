variable "alpine_image" {
  type = string
}

variable "ubuntu_image" {
  type = string
}

variable "version" {
  type = string
}

source "docker" "alpine" {
  image  = var.alpine_image
  commit = true
}

source "docker" "ubuntu" {
  image  = var.ubuntu_image
  commit = true
}

locals {
    organisation = "delineateio"
}
