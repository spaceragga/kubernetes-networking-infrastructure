resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Main Internet Gateway"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.bastion_eip.id
  subnet_id    = aws_subnet.private_subnet[0].id

  tags = {
    Name = "NAT Gateway"
  }
}