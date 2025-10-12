terraform {
  backend "s3" {
    bucket = "pandit-ji077"
    key    = "ayush/terraform.tfstate"
    region = "us-east-1"
  }
}