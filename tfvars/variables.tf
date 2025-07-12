variable "ami_id" {
    type        = string
    default     = "ami-09c813fb71547fc4f"
    description = "ami id of joindevops RHEL9"
}

variable "ec2_tags" {

    type = map(string)
    # Using map(string) allows us to define a map with string keys and values 

    default = {
        Name        = "roboshop"
        purpose = "variables-demo"
    }
}

variable "environment" {

}

variable "sg_name" {
    default = "allow-all"
}

variable "sg_description" {
    default = "Allowing all ports from internet"
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    type   = number
    default = 0
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
}


variable "instances" {
    default = ["mongodb", "redis"] 
}

variable "zone_id" {
    default = "Z07315751QJ0K1IVQMBBK"
}

variable "domain_name" {
    default = "newgenrobots.site"
}

variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}
variable "instance_type" {
    
}