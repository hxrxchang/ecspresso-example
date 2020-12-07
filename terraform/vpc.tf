resource "aws_vpc" "ecspresso_example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ecspresso-example"
  }
}
