packer {
  # We are using aws
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "cocktails" {
  # which ami to sue as the base
  # where to save the ami
  ami_name      = "cocktails-app"
  source_ami    = "ami-035233c9da2fabf52"
  instance_type = "t2.micro"
  region        = "ap-northeast-2"
  ssh_username  = "ec2-user"

}

build {
  # everything in between
  sources = [
    "source.amazon-ebs.cocktails"
  ]

  provisioner "file" {
    source      = "../cocktails.zip"
    destination = "/home/ec2-user/cocktails.zip"
  }

  provisioner "file" {
    source      = "./cocktails.service"
    destination = "/tmp/cocktails.service"
  }

  provisioner "shell" {
    script = "./app.sh"
  }
}
