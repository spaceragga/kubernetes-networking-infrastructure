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

# Security Group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow SSH access to the bastion host"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.bastion_eip.public_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}

# Security Group for Instances in Private Subnets
resource "aws_security_group" "private_subnet_sg" {
  vpc_id      = aws_vpc.main_vpc.id
  name        = "private_subnet_sg"
  description = "Security group for private subnets"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}