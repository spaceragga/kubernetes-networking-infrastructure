# Security Group for Public Subnets
resource "aws_security_group" "public_sg" {
  vpc_id        = aws_vpc.main_vpc.id
  name          = "PublicSG"
  description   = "Allow inbound traffic from anywhere and allow all outbound traffic."

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "Public Security Group"
  }
}

# Security Group for Private Subnets
resource "aws_security_group" "private_sg" {
  vpc_id        = aws_vpc.main_vpc.id
  name          = "PrivateSG"
  description   = "Allow inbound traffic from public subnets and allow all outbound traffic."

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "Private Security Group"
  }
}
