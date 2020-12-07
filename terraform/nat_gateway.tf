resource "aws_eip" "private_subnet_a" {
  vpc = true
  tags = {
    Name = "ecspresso-example-private-subnet-a"
  }
}

resource "aws_eip" "private_subnet_c" {
  vpc = true
  tags = {
    Name = "ecspresso-example-private-subnet-c"
  }
}

resource "aws_nat_gateway" "private_subnet_a" {
  subnet_id     = aws_subnet.private_subnet_a.id
  allocation_id = aws_eip.private_subnet_a.id

  tags = {
    Name = "ecspresso-example-private-subnet-a"
  }
}

resource "aws_nat_gateway" "private_subnet_c" {
  subnet_id     = aws_subnet.private_subnet_c.id
  allocation_id = aws_eip.private_subnet_c.id

  tags = {
    Name = "ecspresso-example-private-subnet-c"
  }
}
