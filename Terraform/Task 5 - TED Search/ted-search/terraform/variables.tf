variable "ami_id" {
  type = string
  default = "ami-0aaa5410833273cfe"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "iam_instance_profile" {
  type = string
  default = "ted-search-jump-server-role"
}

variable "associate_public_ip_address" {
    type = bool
    default = true 
}

variable "key_name" {
  type = string
  default = "ted-search-key"
}

variable "allinone_tag" {
  type = string
  default = "allinone"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type = string
  default = "10.0.0.0/28"
}

variable "subnet_az" {
  type = string
  default = "eu-west-2a"
}