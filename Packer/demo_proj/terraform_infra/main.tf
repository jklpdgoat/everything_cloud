provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example-instance" {
  ami           = "ami-07b79d584cc69e61d"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-infra-example"
  }
}
