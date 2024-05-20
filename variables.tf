variable "public_cidr" {
  default = ["172.20.1.0/24","172.20.2.0/24"]
}

variable "az" {
  default = ["us-east-1a","us-east-1b"]
}

variable "private_cidr" {
  default = ["172.20.3.0/24","172.20.4.0/24"]
}

variable "db_cidr" {
  default = ["172.20.5.0/24","172.20.6.0/24"]
}