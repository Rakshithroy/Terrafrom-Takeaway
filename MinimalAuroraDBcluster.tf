data "aws_vpc" "existing_vpc" {
  id = "vpc-0609be3954ab4dfac"  # Replace with your existing VPC ID
}

data "aws_subnets" "db_subnets" {
    filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
}

resource "aws_rds_cluster" "aurora_db" {
  cluster_identifier      = "my-aurora-db"
  engine                  = "aurora-postgresql"
  master_username         = "Roy"
  master_password         = "password123"
  db_subnet_group_name    = aws_db_subnet_group.my_db_subnet_group.name
  skip_final_snapshot     = true
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = data.aws_subnets.db_subnets.ids
}

output "db_endpoint" {
  value = aws_rds_cluster.aurora_db.endpoint
}
