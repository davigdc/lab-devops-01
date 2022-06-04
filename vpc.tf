resource "aws_vpc" "vpc_lab01" {
  cidr_block       = "10.0.0.0/24"
  enable_dns_hostnames = true

  tags = {
    Name = var.tag_name
  }
}

resource "aws_subnet" "sb_lab01" {
  vpc_id     = aws_vpc.vpc_lab01.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = var.tag_name
  }
}

resource "aws_internet_gateway" "ig_lab01" {
  vpc_id = aws_vpc.vpc_lab01.id

  tags = {
    Name = var.tag_name
  }
}

resource "aws_route_table" "rt_lab01" {
    vpc_id = aws_vpc.vpc_lab01.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig_lab01.id
    }

    tags = {
        Name = var.tag_name
    }
}

resource "aws_route_table_association" "art_lab01" {
    subnet_id = aws_subnet.sb_lab01.id
    route_table_id = aws_route_table.rt_lab01.id
}

resource "aws_security_group" "sg_lab_access" {
  name        = "lab_ports"
  description = "Permite SSH, HTTP e HTTPS na instancia EC2"
  vpc_id      = aws_vpc.vpc_lab01.id

  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP to EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS to EC2"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tag_name
  }
}