# Terraform configuration
resource "docker_container" "web" {
  name = "hashicorp-learn"
  # image = "sha256:1403e55ab369cd1c8039c34e6b4d47ca40bbde39c371254c7cba14756f472f52"
  image = docker_image.nginx.latest

  env = []

  ports {
    external = 8081
    internal = 80
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
