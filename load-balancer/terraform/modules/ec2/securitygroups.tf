resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Security Group for EC2 Instance"

  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = var.cidrs_ssh_ingress
  }

  ingress {
    description = "Allow HTTP from Everywhere"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = var.cidrs_egress
  }

  ingress {
    description = "Allow HTTP from Everywhere"
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = var.cidrs_egress
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.cidrs_egress
  }
}

