resource "aws_ssm_parameter" "db_endpoint_param" {
  name  = "/ecs/db_endpoint"
  type  = "String"
  value = aws_rds_cluster.aurora_db.endpoint
}

resource "aws_ecs_task_definition" "test" {
  family                   = "my-test"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = <<DEFINITION
  [
    {
      "name": "my-container",
      "image": "nginx",
      "memory": 512,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80,
          "protocol": "tcp"
        }
      ],
      "environment": [
        {
          "name": "DB_ENDPOINT",
          "valueFrom": "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/ecs/db_endpoint"
        }
      ]
    }
  ]
  DEFINITION
}
