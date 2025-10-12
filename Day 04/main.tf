provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm01" {
instance_type = "t2.micro"
ami = "ami-0360c520857e3138f" 
}

resource "aws_s3_bucket" "s3_buck" {
 bucket = "pandit-ji077"
}