resource "aws_security_group" "ecspresso-example-web" {
  name = "ecspresso-example-web"
  description = "allow http from alb"
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "ecspresso-example-web"
  }
}

resource "aws_security_group" "ecspresso-example-alb" {
  name = "ecspresso-example-alb"
  description = "allow access from internet for alb"
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "ecspresso-example-alb"
  }
}

resource "aws_security_group_rule" "ecspresso-example-alb-http" {
  type = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.ecspresso-example-alb.id
}
