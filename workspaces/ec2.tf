resource "aws_instance" "roboshop" {
  count    = length(var.instances)
  ami        = var.ami_id
  instance_type = lookup(var.instance_type, terraform.workspace)  
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = merge(
    var.common_tags,
    {
           name = "${var.instances[count.index]}-${terraform.workspace}"
           component = var.instances[count.index]
           environment = terraform.workspace
    }
  ) 
       
}

resource "aws_security_group" "allow_all" {
  name        = "${var.sg_name}-${terraform.workspace}" #allow-all-dev 
  description = var.sg_description 

  ingress {

     from_port        = var.from_port
     to_port          = var.to_port
     protocol         = "-1"
     cidr_blocks      = var.cidr_blocks
     ipv6_cidr_blocks = ["::/0"]
   
  }
  egress {
     
     from_port        = var.from_port
     to_port          = var.to_port    #Using "-1" for protocol allows all protocols
     protocol         = "-1"
     cidr_blocks      = var.cidr_blocks
     ipv6_cidr_blocks = ["::/0"]

  }
  
  tags =  merge(
    var.common_tags,
    {
      name = "${var.sg_name}-${terraform.workspace}" #allow-all-dev 
    }
  )
}