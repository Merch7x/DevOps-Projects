terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " > 4.38.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-2"
  access_key = var.access_key
  secret_key = var.secret_key

}

resource "aws_instance" "ec21" {
  ami             = var.ami
  instance_type   = var.type
  count = 3
  security_groups = ["${aws_security_group.allow_tls.name}"]
}



resource "aws_security_group" "allow_tls" {
  name        = "My-SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id


  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
