resource "aws_lb" "alb" {
  load_balancer_type = "application"
  name = var.PROJECT_NAME

  security_groups = [aws_security_group.ecspresso_example_alb.id]
  subnets = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_c.id]
}

resource "aws_lb_target_group" "ecs_web" {
  name = var.PROJECT_NAME
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.ecspresso_example.id
  target_type = "ip"

  tags = {
    Name = var.PROJECT_NAME
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.id
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.ecs_web.arn
    type = "forward"
  }
}

