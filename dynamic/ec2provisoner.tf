resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "terraform-1"
        Terraform = "true"
    }
    provisioner "local-exec" {
      command = " echo Redirecting Private IP ${self.private_ip} > inventory "
    }

    provisioner "local-exec" {
      command = " echo Instance with Private IP ${self.private_ip} is getting destroyed"
        when    = destroy
    }

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      password    = "DevOps321"
    }

    provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
      ]
    }
    provisioner "remote-exec" {
      inline = [
        "echo 'Removing nginx'",
        "sudo systemctl stop nginx",
        "sudo dnf remove nginx -y"
      ]
      when = destroy
    }
}
