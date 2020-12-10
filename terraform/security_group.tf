resource "aws_security_group" "ecspresso-example-web" {
  name = "ecspresso-example-web"
  description = "allow http from alb"
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "ecspresso-example-web"
  }
}
