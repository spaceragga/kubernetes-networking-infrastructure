resource "aws_instance" "bastion_host" {
  ami           = var.bastion_ami_id
  instance_type = var.bastion_instance_type
  subnet_id     = aws_subnet.public_subnet[0].id
  key_name      = var.bastion_key_name

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "Bastion Host"
  }
}