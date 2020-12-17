resource "aws_internet_gateway" "ecspresso_example" {
  vpc_id = aws_vpc.ecspresso_example.id

  tags = {
    Name = "${var.PROJECT_NAME}-internet-gateway"
  }
}
