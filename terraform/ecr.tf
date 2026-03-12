resource "aws_ecr_repository" "microk8s-ecr-repo" {
  name                 = "thumama/django-app"
  image_tag_mutability = "MUTABLE"
}