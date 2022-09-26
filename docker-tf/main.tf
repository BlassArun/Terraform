# this is Arun terraform file

/* main.tf
   Alta3 Research - rzfeeser@alta3.com
   CHALLNEGE 01 - terraform configuration file to deploy an nginx container */


terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}
