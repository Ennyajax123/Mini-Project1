terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
<<<<<<< HEAD
      version = "5.70.0"
    }
  }
}
provider "aws" {
  region = "eu-west-2"
}
# Create a VPC
resource "aws_vpc" "example1" {
  cidr_block = "10.0.0.0/16"
}
# creating the frontend system

resource "aws_security_group" "frontend-1-sg" {
  name = "MProj1-frontend-1-sg"
=======
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
>>>>>>> 78e9654b6043f84e83356a05f9eaca2393eede72
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

<<<<<<< HEAD
resource "aws_instance" "frontend-1" {
  ami                    = var.frontend-1_ami
  instance_type          = var.frontend-1_instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.frontend-1_key_name
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
  ami                    = var.frontend-2_ami
  instance_type          = var.frontend-2_instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.frontend-2_key_name
  user_data              = file("./frontend-install.sh")
  vpc_security_group_ids = [aws_security_group.frontend-2-sg.id]
  tags = {
    Name = "frontend-2"
  }
}

# creating the backend system
resource "aws_security_group" "backend-1-sg" {
  name = "MProj1-backend-1-sg"
=======
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
>>>>>>> 78e9654b6043f84e83356a05f9eaca2393eede72
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

<<<<<<< HEAD
resource "aws_instance" "backend-1" {
  ami                    = var.backend-1_ami
  instance_type          = var.backend-1_instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.backend-1_key_name
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
  ami                    = var.backend-2_ami
  instance_type          = var.backend-2_instance_type
  availability_zone      = "eu-west-2b"
  key_name               = var.backend-2_key_name
  user_data              = file("./backend-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-2-sg.id]
  tags = {
    Name = "backend-2"
  }
}


# creating the Database system
resource "aws_security_group" "database-1-sg" {
  name = "MProj1-Database-1-sg"
=======
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
>>>>>>> 78e9654b6043f84e83356a05f9eaca2393eede72
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

<<<<<<< HEAD
resource "aws_instance" "database-1" {
  ami                    = var.database-1_ami
  instance_type          = var.database-1_instance_type
  availability_zone      = "eu-west-2a"
  key_name               = var.database-1_key_name
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


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
variable "region_number1" {
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



=======
resource "aws_instance" "Database" {
  ami                    = var.Database_ami
  instance_type          = var.Database_instance_type
  key_name               = var.Database_key_name
  #user_data              = file("./Database-install.sh")
  vpc_security_group_ids = [aws_security_group.backend-sg.id]
  tags = {
    Name = "Database"
  }
}
>>>>>>> 78e9654b6043f84e83356a05f9eaca2393eede72
