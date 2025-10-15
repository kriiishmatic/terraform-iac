variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  type = string
  default = "t3.micro"
}
variable "tags" {
  type = map(string)
  default = {
    Terraform = "true"
    Name = "Typo"
  }
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