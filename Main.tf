terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

# creating the frontend system

resource "aws_security_group" "frontend-sg" {
  name = "MProj1-frontend-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "front-end" {
  ami                    = var.frontend_ami
  instance_type          = var.frontend_instance_type
  key_name               = var.frontend_key_name
  user_data              = file("./frontend-install.sh")
  vpc_security_group_ids = [aws_security_group.frontend-sg.id]
  tags = {
    Name = "front-end"
  }
}



# creating the backend system
resource "aws_security_group" "backend-sg" {
  name = "MProj1-backend-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "backend" {
  ami                    = var.backend_ami
  instance_type          = var.backend_instance_type
  key_name               = var.backend_key_name
  #user_data              = file("./backend-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-sg.id]
  tags = {
    Name = "backend"
  }
}



# creating the Database system
resource "aws_security_group" "Database-sg" {
  name = "MProj1-Database-sg"
  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "Database" {
  ami                    = var.Database_ami
  instance_type          = var.Database_instance_type
  key_name               = var.Database_key_name
  #user_data              = file("./Database-install.sh")
  vpc_security_group_ids = [aws_security_group.Database-sg.id]
  tags = {
    Name = "Database"
  }
}



variable "region_number1" {
  # Arbitrary mapping of region name to number to use in
  # a VPC's CIDR prefix.
  default = {
    eu-east-1      = 1
    eu-west-2      = 2
    eu-west-3      = 3
  }
}

variable "az_number" {
  # Assign a number to each AZ letter used in our configuration
  default = {
    a = 1
    b = 2
    c = 3
  }
}

# Retrieve the AZ where we want to create network resources
# This must be in the region selected on the AWS provider.
data "aws_availability_zone" "example" {
  name = "eu-west-1a"
}

# Create a VPC for the region associated with the AZ
resource "aws_vpc" "example" {
  cidr_block = cidrsubnet("10.0.0.0/8", 4, var.region_number[data.aws_availability_zone.example.region])
}

# Create a subnet for the AZ within the regional VPC
resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = cidrsubnet(aws_vpc.example.cidr_block, 4, var.az_number[data.aws_availability_zone.example.name_suffix])
}