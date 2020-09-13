provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "reet-terraform-state"
    key = "global/s3/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "reet-terraform-locks"
    encrypt = true
  }
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
}
