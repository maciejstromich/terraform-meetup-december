variable "region" {
  description = "The AWS region"
}
variable "aws_profile" {
  description = "AWS Profile to use"
  default = "terraform"
}

variable "shortname" {
  description = "The name for everything related to this setup"
  default     = "tfmeetup"
}

variable "vpc_cidr" {
  description = "The CIDR of the network created in the VPC"
}

variable "subnet_cidr" {
  description = "The CIDR of the subnet created in the VPC"
}
