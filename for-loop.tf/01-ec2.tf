resource "aws_instance" "Typo"{
    for_each = var.environment
    # for_each = toset(var.environment)
    ami = var.ami_id
    instance_type = each.value
    depends_on = [aws_security_group.inbound]
    vpc_security_group_ids = [aws_security_group.inbound.id]
     tags = {
        # Name = each.key
        Name = each.key
        Terraform = "true"
     }      
}

resource "aws_security_group" "inbound"{
  name        = var.sg_name
  # Ingress: from_port = 0, to_port = 0, protocol = "-1" -> all protocols / all ports
  ingress {
    description      = "Allow all inbound traffic"
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.ingress_protocol
    cidr_blocks      = var.ingress_cidr_blocks
    
  }

  # Egress: same as above (all outbound)
  egress {
    description      = "Allow all outbound traffic"
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.ingress_protocol
    cidr_blocks      = var.egress_cidr_blocks
  }

    tags = var.sg_tags
}


  
