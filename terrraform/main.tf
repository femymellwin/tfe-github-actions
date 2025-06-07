provider "aws" {
  region = var.region
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "aws_instance" "test_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "GitHub-Actions-VM1"
  }
}

