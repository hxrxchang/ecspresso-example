resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.ecspresso_example.id

  availability_zone = "ap-northeast-1a"

  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "ecspresso-example-public-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id = aws_vpc.ecspresso_example.id

  availability_zone = "ap-northeast-1a"

  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "ecspresso-example-private-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id = aws_vpc.ecspresso_example.id

  availability_zone = "ap-northeast-1c"

  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "ecspresso-example-public-subnet-c"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id = aws_vpc.ecspresso_example.id

  availability_zone = "ap-northeast-1c"

  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "ecspresso-example-private-subnet-c"
  }
}
