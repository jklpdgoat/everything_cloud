packer {
  # We are using aws
  required_plugins {
    amazon = {
      version = ">= 1.0.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "cocktails" {
  # which ami to sue as the base
  # where to save the ami
  ami_name     = "cocktails-app"
  source_ami   = "ami-0a606d8395a538502"
  intance_type = "t2.micro"
  region       = "us-west-2"
  ssh_username = "ec2-user"

}

build {
  # everything in between
  sources = [
    "source.amazon-ebs.cocktails"
  ]

  provisioner "shell" {
    script = "./app.sh"
  }

  provisioner "file" {

  }
}
