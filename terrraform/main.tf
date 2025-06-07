provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}


resource "aws_instance" "test_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "GitHub-Actions-VM1"
  }
}

