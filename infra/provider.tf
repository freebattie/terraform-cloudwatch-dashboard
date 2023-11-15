terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.39.0"
    }
  }

  // trenges for å ikke lagres lokalt eller på github under github actions
  backend "s3" {
    bucket = "bjne222"
    key    = "bjne002/apprunner-a-new-state.state"
    region = "eu-west-1"
  }


}


resource "aws_iam_instance_profile" "bjne_apprunner_cloudwatch_profile" {

  name = "bjne_apprunner_cloudwatch_profile"
  role = aws_iam_role.bjne_apprunner_cloudwatch_role.name

}


resource "aws_iam_role" "bjne_apprunner_cloudwatch_role" {

  name = "bjne_apprunner_cloudwatch_role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement":
    [
        {
            "Effect": "Allow",
            "Principal":
            {
                "Service": "tasks.apprunner.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }

EOF

}
resource "aws_iam_role_policy_attachment" "bjne_apprunner_cloudwatch_attachment" {

  role       = aws_iam_role.bjne_apprunner_cloudwatch_role.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"

}
