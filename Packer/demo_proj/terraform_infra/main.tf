provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example-instance" {
  ami                    = "ami-07b79d584cc69e61d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "terraform-infra-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-infra-example-sg"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
