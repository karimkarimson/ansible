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
  name        = "prometheus-sg"
  description = "Allow SSH, HTTP inbound traffic"
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  description       = "SSH from anywhere"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
resource "aws_security_group_rule" "http" {
  type              = "ingress"
  description       = "HTTP from anywhere"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
resource "aws_security_group_rule" "grafana" {
  type              = "ingress"
  description       = "Grafana on 3000"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
resource "aws_security_group_rule" "prometheus_rule" {
  type              = "ingress"
  description       = "Prometheus on 9090"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
resource "aws_security_group_rule" "prometheus_rule_2" {
  type              = "ingress"
  description       = "Prometheus on 9100"
  from_port         = 9100
  to_port           = 9100
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
#* EC2 Instance 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami             = "ami-06dd92ecc74fdfb36"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg.name]
  key_name        = "ssh-october"
  tags = {
    Name = "Ubuntu Server"
  }
}
resource "aws_instance" "prometheus" {
  ami             = "ami-06dd92ecc74fdfb36"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg.name]
  key_name        = "ssh-october"
  tags = {
    Name = "Prometheus Server"
  }
}

#* Write IP to file for Ansible
resource "local_file" "ubuntu_ip" {
  content  = aws_instance.ubuntu.public_ip
  filename = "${path.root}/ubuntu_ip"
}
#* Write IP to file for Ansible
resource "local_file" "prometheus_ip" {
  content  = aws_instance.prometheus.public_ip
  filename = "${path.root}/prometheus_ip"
}

output "ubuntu_ip" {
  value = aws_instance.ubuntu.public_ip
}
output "prometheus_ip" {
  value = aws_instance.prometheus.public_ip
}