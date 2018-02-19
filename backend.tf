terraform {
 required_version = ">= 0.10.1"

 backend "s3" {
  bucket = "terraform-state-rk840522"
  key = "terraform/jenkins-docker-demo"
  region = "eu-west-1"
  dynamodb_table = "terraform-state-lock-dynamo"
  encrypt        = true
 }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "terraform-state-rk840522"
    key = "terraform/jenkins-docker-demo"
    region = "eu-west-1"
  # Tells Terraform that state must be created only after the
  # S3 bucket has been created.
  depends_on = "terraform-state-rk840522"
  }
}