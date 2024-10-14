resource "aws_instance" "nat_instance" {
  ami                   = var.ami_id
  instance_type         = "t2.micro"
  subnet_id             = aws_subnet.private_subnet[0].id
  security_groups       = [aws_security_group.private_subnet_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "NAT Instance"
  }
}

resource "aws_eip" "bastion_eip" {
  domain = "vpc"
}