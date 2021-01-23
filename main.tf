data "aws_ami" "web_ami" {
  most_recent = true
  owners      = ["563297438969"]


  filter {
    name   = "name"
    values = ["packer-ami-*"]
  }
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.web_ami.id
  instance_type   = var.instancetype
  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = "HelloWorld-KR"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP/S inbound traffic"

  ingress {
    description = "HTTP from from home IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from from home IP"
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
    Name = "allow_http"
  }
}