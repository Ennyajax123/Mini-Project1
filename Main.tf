terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}
provider "aws" {
  region  = var.region
}
# Create a VPC
# resource "aws_vpc" "my-project-vpc" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "main"
#   }
# }
# creating the frontend system

resource "aws_security_group" "frontend-1-sg" {
  name = "MProj1-frontend-1-sg"
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

resource "aws_instance" "frontend-1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.key_name
  user_data              = file("./frontend-install.sh")
  vpc_security_group_ids = [aws_security_group.frontend-1-sg.id]
  tags = {
    Name = "frontend-1"
  }
}

# creating the frontend system

resource "aws_security_group" "frontend-2-sg" {
  name = "MProj1-frontend-2-sg"
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

resource "aws_instance" "frontend-2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.key_name
  user_data              = file("./frontend-install.sh")
  vpc_security_group_ids = [aws_security_group.frontend-2-sg.id]
  tags = {
    Name = "frontend-2"
  }
}

# creating the backend system
resource "aws_security_group" "backend-1-sg" {
  name = "MProj1-backend-1-sg"
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

resource "aws_instance" "backend-1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.key_name
  user_data              = file("./backend-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-1-sg.id]
  tags = {
    Name = "backend-1"
  }
}

# creating the backend system
resource "aws_security_group" "backend-2-sg" {
  name = "MProj1-backend-2-sg"
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
resource "aws_instance" "backend-2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.key_name
  user_data              = file("./backend-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-2-sg.id]
  tags = {
    Name = "backend-2"
  }
}


# creating the Database system
resource "aws_security_group" "database-1-sg" {
  name = "MProj1-Database-1-sg"
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

resource "aws_instance" "database-1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.key_name
  user_data              = file("./Database-install.sh")
  vpc_security_group_ids = [aws_security_group.database-1-sg.id]
  tags = {
    Name = "database-1"
  }
}

# creating RDS system using Terraform
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.mainvpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "eniola"
  password             = "eniola123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  publicly_accessible    = true
}


# resource "aws_db_instance" "default" {
#   allocated_storage      = 10
#   engine                 = "mysql"
#   engine_version         = "5.7"
#   instance_class         = "db.t3.micro"
#   parameter_group_name   = "default.mysql5.7"
#   availability_zone      = "eu-west-2"
#   skip_final_snapshot    = true
#   publicly_accessible    = true
# }
variable "region" {
  # Arbitrary mapping of region name to number to use in
  # a VPC's CIDR prefix.
  default = {
    eu-west-1 = 1
    eu-west-2 = 2
    eu-west-3 = 3
  }
}

variable "AZ_number1" {
  # Assign a number to each AZ letter used in our configuration
  default = {
    a = 1
    b = 2
    c = 3
  }
}



