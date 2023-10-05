# variable "vpc_cidr" {
#   default = "10.0.0.0/16"
# }

# variable "ami" {
#   default = "ami-0f5ee92e2d63afc18"
# }

# variable "instance_type" {
#   default = "t2.micro"
# }

# variable "key_name" {
#   default = "desktop-key"
# }

# variable "subnet_cidr" {
#   default = "10.0.0.0/24"
# }

# variable "allow_all" {
#   default = "0.0.0.0/0"
# }

# variable "rt_cidr" {
#   default = "0.0.0.0/0"
# }

# variable "az" {
#   default = "ap-south-1a"
# }

# variable "server_name" {
#   default = "server"
# }

# variable "egress" {
#   default = [22, 80]
# }

# variable "ingress" {
#   default = [22, 80, 443, 8080, 555]
# }

# variable "region" {
#   default = "ap-south-1"
# }

variable "vpc_cidr" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_cidr_public" {}
variable "subnet_cidr_private" {}
variable "allow_all" {}
variable "rt_cidr" {}
variable "az" {}
variable "server_name" {}
variable "egress" {}
variable "ingress" {}
variable "region" {}


