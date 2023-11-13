output "ec2_ip" {
  description = "EC2 IPs"
  value       = module.ec2_module.ec2_ip
}
output "ec2_private_ip" {
  description = "EC2 Private IPs"
  value       = module.ec2_module.ec2_private_ip

}

resource "local_file" "IPs" {
  count    = length(module.ec2_module.ec2_ip)
  content  = module.ec2_module.ec2_ip[count.index]
  filename = "${path.root}/ip_${count.index}"
}

resource "local_file" "PrivateIPs" {
  count    = length(module.ec2_module.ec2_private_ip)
  content  = module.ec2_module.ec2_private_ip[count.index]
  filename = "${path.root}/private_ip_${count.index}"
}