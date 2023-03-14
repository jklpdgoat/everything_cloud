terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  # ami-00b291d0ffee81509
  ami           = "ami-0df24e148fdb9f1d8" # Switch to x86
  instance_type = "t2.micro"
}
