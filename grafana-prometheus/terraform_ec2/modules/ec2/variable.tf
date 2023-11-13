variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "instance_ami" {
  type = string
  default = "ami-06dd92ecc74fdfb36"
}

variable "key" {
  type = string
  default = "ssh-october"
}

variable "cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "84.153.40.149/32"]
}