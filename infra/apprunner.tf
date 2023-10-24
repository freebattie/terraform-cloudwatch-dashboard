resource "aws_apprunner_service" "service" {
  service_name = "${var.prefix}-apprunner"
  source_configuration {



    image_repository {

      image_configuration {

        port = "8080"
      }

      image_identifier      = var.image
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true

  }
}
