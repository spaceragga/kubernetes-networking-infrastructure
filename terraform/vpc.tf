# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Main-VPC"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = var.az_1

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = "Public Subnet 2"
  }
}

# Private Subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = var.az_1

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = "Private Subnet 2"
  }
}
