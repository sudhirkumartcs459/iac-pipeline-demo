data "aws_ami" "web_ami" {
  most_recent = true
  owners      = ["563297438969"]


  filter {
    name   = "name"
    values = ["packer-ami-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.web_ami.id
  instance_type = var.instace_type

  tags = {
    Name = "HelloWorld-KR"
  }
}