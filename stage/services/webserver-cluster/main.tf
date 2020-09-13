provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webserver-cluster-stage"
  server_port = 8080
  db_remote_state_bucket = "reet-terraform-state"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}