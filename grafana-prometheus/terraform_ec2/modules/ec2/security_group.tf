# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "sg" {
  count = length(var.subnet_ids)
  name        = "tf_sg_${count.index}"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}", "${var.cidrs[count.index + 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  ingress {
    description = "HTTP"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  ingress {
    description = "HTTP"
    from_port = 9093
    to_port = 9093
    protocol = "tcp"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  ingress {
    description = "HTTP"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  ingress {
    description = "Grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  ingress {
    description = "Allow Ping"
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = count.index > 0 ? ["${var.cidrs[count.index - 1]}"] : ["${var.cidrs[count.index + 1]}", "${var.cidrs[count.index + 2]}"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}