variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "mongodb_tags" {
  default = {}
}
variable "redis_tags" {
  default = {}
}
variable "mysql_tags" {
  default = {}
}
variable "rabbitmq_tags" {
  default = {}
}
variable "zone_id" {
  default = "Z07326442Z8C3IRLJ3030"
}

variable "domain_name" {
  default = "cloudkarna.in"
}




