resource "aws_instance" "ec2_instance" {
  count = var.instance_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.ec2_sg.name]
  key_name        = var.key_name
}