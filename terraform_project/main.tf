provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "my-first-server" {
  ami           = "ami-02045ebddb047018b"
  instance_type = "t2.micro"

  tags = {
    # Name = "Ubuntu"
  }
}
