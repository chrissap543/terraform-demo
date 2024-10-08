terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "devops-demo-tfstate"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = ">= 1.2.0"
}

locals {
  num_of_instances = 4
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  count         = local.num_of_instances

  tags = {
    Name = "ExampleAppServerInstance-${count.index}"
  }
}