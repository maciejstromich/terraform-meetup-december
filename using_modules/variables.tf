variable "access_key" {
  description = "The AWS Access key"
}

variable "secret_key" {
  description = "The AWS secret key"
}

variable "region" {
  description = "The AWS region"
  default = "us-west-2"
}

variable "shortname" {
  description = "The name for everything related to this setup"
  default     = "tfmeetup"
}

variable "vpc_cidr" {
  description = "The CIDR of the network created in the VPC"
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR of the subnet created in the VPC"
  default     = "172.16.1.0/24"
}
