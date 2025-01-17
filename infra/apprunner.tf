resource "aws_apprunner_service" "service" {
  service_name = "${var.prefix}-apprunner"
  depends_on = [aws_iam_role.bjne_apprunner_cloudwatch_role]

instance_configuration {


  instance_role_arn = "arn:aws:iam::244530008913:role/${aws_iam_role.bjne_apprunner_cloudwatch_role.name}"

}
  source_configuration {

    authentication_configuration {
      access_role_arn = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
      #service_role_arn = "arn:aws:iam::244530008913:instance-profile/apprunner_bjen"


    }

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
