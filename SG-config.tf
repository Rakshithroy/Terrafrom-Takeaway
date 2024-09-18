resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Allow traffic between ECS tasks and DB"
  vpc_id      = data.aws_vpc.existing_vpc.id  

 
  ingress {
    from_port   = 5432  
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}