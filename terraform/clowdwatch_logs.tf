resource "aws_cloudwatch_log_group" "ecspresso_example_web" {
  name = "/ecs/${var.PROJECT_NAME}/${var.ECS_SERVICE_NAME}"
}
