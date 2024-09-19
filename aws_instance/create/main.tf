terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

locals {
  num_of_instances = 1
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  count         = local.num_of_instances

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

# resource "aws_ec2_instance_state" "stop" {
#   count       = local.shouldstop ? 1 : 0
#   instance_id = aws_instance.app_server.id
#   state       = "stopped"
# }