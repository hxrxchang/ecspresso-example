resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "${var.PROJECT_NAME}-public-subnet-route-table"
  }
}

resource "aws_route_table" "private_subnet_a" {
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "${var.PROJECT_NAME}-private-subnet-a-route-table"
  }
}

resource "aws_route_table" "private_subnet_c" {
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "${var.PROJECT_NAME}-private-subnet-c-route-table"
  }
}

resource "aws_route" "internet" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.public.id
  gateway_id = aws_internet_gateway.ecspresso_example.id
}

resource "aws_route" "nat_for_subnet_a" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.private_subnet_a.id
  nat_gateway_id = aws_nat_gateway.private_subnet_a.id
}

resource "aws_route" "nat_for_subnet_c" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.private_subnet_c.id
  nat_gateway_id = aws_nat_gateway.private_subnet_c.id
}

resource "aws_route_table_association" "public_subnet_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_subnet_a.id
}

resource "aws_route_table_association" "private_subnet_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private_subnet_c.id
}
