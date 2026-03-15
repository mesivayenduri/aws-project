resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "My-IGW"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.allocation_id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "My-NAT-Gateway"
  }

  depends_on = [aws_internet_gateway.gw]
}