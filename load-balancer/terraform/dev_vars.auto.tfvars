# AWS Credentials
aws_profile = "ENTER_YOUR_AWS_SSO_CLI_PROFILE"
region      = "eu-central-1"

# Variables for EC2 Module
ami_id            = "ami-06dd92ecc74fdfb36"
instance_type     = "t2.micro"
key_name          = "ssh-october"
cidrs_ssh_ingress = ["ENTER_YOUR_LOCAL_IP_HERE/32"]
cidrs_egress      = ["0.0.0.0/0"]

instance_count = 4