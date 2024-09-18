provider "aws" {
  region = "us-east-1"  
}

resource "aws_ecs_cluster" "my_fargate_cluster" {
  name = "my-fargate-cluster"
}
