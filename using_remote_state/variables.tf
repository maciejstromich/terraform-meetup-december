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
