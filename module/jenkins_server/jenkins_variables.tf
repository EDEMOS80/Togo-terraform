variable "aws_region" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "root_volume" {
  type = number
}

variable "aws_ami" {
  type = string
}
variable "resource_type" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}