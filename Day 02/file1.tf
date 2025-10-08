terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "***************************"
  secret_key = "********************************"
}

resource "aws_instance" "web" {
  ami           = "ami-066eb5725566530f0"
  instance_type = "t3.micro"
  key_name = "pandey"

  tags = {
    Name = "vm01"
  }
}
