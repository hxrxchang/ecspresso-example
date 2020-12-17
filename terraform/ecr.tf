resource "aws_ecr_repository" "ecspresso_example_web" {
  name                 = "${var.PROJECT_NAME}-${var.ECS_SERVICE_NAME}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
