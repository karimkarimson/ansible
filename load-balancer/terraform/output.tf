output "instance_ip" {
  value = module.ec2.instance_ip
}
output "instance_private_ip" {
  value = module.ec2.instance_private_ip
}

resource "local_file" "IPs" {
  count    = length(module.ec2.instance_ip)
  content  = module.ec2.instance_ip[count.index]
  filename = "${path.root}/ip_${count.index}"
}
resource "local_file" "PrivateIPs" {
  count    = length(module.ec2.instance_private_ip)
  content  = module.ec2.instance_private_ip[count.index]
  filename = "${path.root}/private_ip_${count.index}"
}