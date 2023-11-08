terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#* AWS Profile
provider "aws" {
  region  = "eu-central-1"
  profile = "techstarte"
}

#* Security Group - Definitions
resource "aws_security_group" "sg" {
  name        = "ansible_instance_sg"
  description = "Allow SSH, HTTP inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana Logging"
    from_port   = 3333
    to_port     = 3333
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#* EC2 Instance 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami                  = "ami-06dd92ecc74fdfb36"
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.sg.name]
  key_name             = "ssh-october"
}

#* Write IP to file for Ansible
resource "local_file" "ubuntu_ip" {
  content  = aws_instance.ubuntu.public_ip
  filename = "${path.root}/ubuntu_ip"
}

output "ubuntu_ip" {
  value = aws_instance.ubuntu.public_ip
}