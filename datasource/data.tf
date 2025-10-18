data "aws_ami" "example" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "aws_ami" {
  value = data.aws_ami.example.id
}

data "aws_instance" "mongodb" {
  instance_id = "i-0be3db3c51341b430"
}

output "mongodb_info" {
    value = data.aws_instance.mongodb.public_ip
}