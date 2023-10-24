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