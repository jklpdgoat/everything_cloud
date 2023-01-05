provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "foo" {
  ami           = "ami-094125af156557ca2"
  instance_type = "t2.micro"
  tags = {
    Name = "TF-Instance"
  }
}
