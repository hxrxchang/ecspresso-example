resource "aws_ecr_repository" "ecspresso_example" {
  name                 = "ecspresso_example"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
