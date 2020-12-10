resource "aws_lb" "ecspresso-example" {
  load_balancer_type = "application"
  name = "ecspresso-example"

  security_groups = [aws_security_group.ecspresso_example_alb.id]
  subnets = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_c.id]
}

resource "aws_lb_target_group" "ecspresso-example" {
  name = "ecspresso-example"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.ecspresso_example.id
  target_type = "ip"

  tags = {
    Name = "ecspresso-example"
  }
}

resource "aws_lb_listener" "ecspresso-example" {
  load_balancer_arn = aws_lb.ecspresso-example.id
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.ecspresso-example.arn
    type = "forward"
  }
}

