module "ec2" {
  source = "./modules/ec2"

  # Variables
  key_name          = var.key_name
  profile_name      = var.aws_profile
  cidrs_ssh_ingress = var.cidrs_ssh_ingress
  cidrs_egress      = var.cidrs_egress
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  instance_count    = var.instance_count

}