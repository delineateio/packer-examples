packer {
  required_plugins {
    docker = {
      version = "1.0.1"
      source  = "github.com/hashicorp/docker"
    }
  }
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.alpine",
    "source.docker.ubuntu"
  ]
  provisioner "shell" {
    inline = [
      "echo 'Alpine: ${var.alpine_image}'",
      "echo 'Ubuntu: ${var.ubuntu_image}'",
    ]
  }
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }
  post-processor "docker-tag" {
    repository = "${local.organisation}/alpine"
    tags       = ["${var.version}"]
    only       = ["docker.alpine"]
  }
  post-processor "docker-tag" {
    repository = "${local.organisation}/ubuntu"
    tags       = ["${var.version}"]
    only       = ["docker.ubuntu"]
  }
}
