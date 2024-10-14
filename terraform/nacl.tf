# Network ACL for Public Subnets
resource "aws_network_acl" "public_acl" {
  vpc_id = aws_vpc.main_vpc.id

  # Add public subnet associations here
  ingress {
    rule_no     = 100
    action      = "allow"
    protocol    = "tcp"
    from_port   = 0
    to_port     = 65535
    cidr_block  = "0.0.0.0/0"
  }

  egress {
    rule_no     = 100
    action      = "allow"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_block  = "0.0.0.0/0"
  }

  tags = {
    Name = "Public Network ACL"
  }
}

# Associate Public Network ACL with Public Subnets
resource "aws_network_acl_association" "public_assoc" {
  count          = length(var.azs)
  network_acl_id = aws_network_acl.public_acl.id
  subnet_id      = aws_subnet.public_subnet[count.index].id
}

# Network ACL for Private Subnets
resource "aws_network_acl" "private_acl" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    rule_no     = 100
    action      = "allow"
    protocol    = "tcp"
    from_port   = 0
    to_port     = 65535
    cidr_block  = aws_subnet.public_subnet[0].cidr_block
  }

  egress {
    rule_no     = 100
    action      = "allow"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_block  = "0.0.0.0/0"
  }

  tags = {
    Name = "Private Network ACL"
  }
}

# Associate Private Network ACL with Private Subnets
resource "aws_network_acl_association" "private_assoc" {
  count          = length(var.azs)
  network_acl_id = aws_network_acl.private_acl.id
  subnet_id      = aws_subnet.private_subnet[count.index].id
}