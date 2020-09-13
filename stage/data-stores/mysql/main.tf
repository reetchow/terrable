provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "reet-terraform-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "reet-terraform-locks"
    encrypt = true
  }
}

resource "aws_db_instance" "mysql-db" {
  identifier_prefix = "reet-terraform-db"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database"
  username = "admin"

  // how should we set the password?
  password = "useawssecretsmanagerdatasource"
}