provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "github.com/reetchow/terrable-modules//services/webserver-cluster?ref=v0.0.1"

  cluster_name = "webserver-cluster-stage"
  server_port = 8080
  db_remote_state_bucket = "reet-terraform-state"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}