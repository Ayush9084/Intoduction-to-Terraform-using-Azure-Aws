provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "vm01" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  associate_public_ip_address = true
}