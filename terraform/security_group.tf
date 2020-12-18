resource "aws_security_group" "ecspresso_example_ecs_web" {
  name = "${var.PROJECT_NAME}-ecs-web"
  description = "allow http from alb"
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "${var.PROJECT_NAME}-ecs-web"
  }
}

resource "aws_security_group" "ecspresso_example_alb" {
  name = "${var.PROJECT_NAME}-alb"
  description = "allow access from internet for alb"
  vpc_id = aws_vpc.ecspresso_example.id
  tags = {
    Name = "${var.PROJECT_NAME}-alb"
  }
}

resource "aws_security_group_rule" "ecspresso_example_alb_http" {
  type = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.ecspresso_example_alb.id
}

resource "aws_security_group_rule" "ecspresso_example_web_http" {
  type = "ingress"
  from_port = 3000
  to_port   = 3000
  protocol  = "tcp"

  security_group_id = aws_security_group.ecspresso_example_ecs_web.id
  source_security_group_id =aws_security_group.ecspresso_example_alb.id
}

resource "aws_security_group_rule" "ecspresso_example_web_sg_out_all" {
  type        = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 0
  protocol    = "-1"

  security_group_id = aws_security_group.ecspresso_example_ecs_web.id
}

resource "aws_security_group_rule" "ecspresso_example_alb_sg_out_all" {
  type        = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 0
  protocol    = "-1"

  security_group_id = aws_security_group.ecspresso_example_alb.id
}
