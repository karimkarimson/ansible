output "instance_ip" {
  value = aws_instance.ec2_instance[*].public_ip
}
output "instance_private_ip" {
  value = aws_instance.ec2_instance[*].private_ip
}