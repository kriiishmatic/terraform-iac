variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}
# variable "instance_type" {
#   type = string
#   default = "t3.micro"
# }
variable "instance" {
  type = list(string)
  default = ["mysql","redis","rabbitmq","mongo"]
  }

variable "aws_region" {
  type = string
  default = "us-east-1"
}
variable "sg_name" {
  type = string
  default = "inbound"
  
}
variable "ingress_from_port" {
  type = number
  default = 0
  
}
variable "ingress_to_port" {
  type = number
  default = 0
  
}
variable "ingress_protocol" {
  type = string
  default = "-1"
  
}
variable "ingress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
variable "egress_from_port" {
  type = number
  default = 0
  
}
variable "egress_to_port" {
  type = number
  default = 0
  
}
variable "egress_protocol" {
  type = string
  default = "-1"
  
}
variable "egress_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
variable "sg_tags" {
  type = map(string)
  default = {
    description = "Allow all outbound traffic"
    Terraform = "true"
    Name = "inbound"
  }
}
variable "environment" {
  type    = string
  default = "dev"
  
}
variable "zone_id" {
  type = string
  default = "Z0212707MY585LOOEFGA"
}

variable "domain_name" {
  type = string
  default = "kriiishmatic.com"
}