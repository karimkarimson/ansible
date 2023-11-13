output "ec2_ip" {
  description = "EC2 IP"
  value       = aws_instance.test.*.public_ip
}
output "ec2_private_ip" {
  description = "EC2 Private IP"
  value = aws_instance.test.*.private_ip
}