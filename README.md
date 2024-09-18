# Terrafrom-Takeaway
Terraform Takeaway 
Create a ECS cluster and database in an existing VPC ( no need to write code for VPC) and the configuration must use remote data source to retrieve information from the resources to bind them 

1) Create ECS cluster using fargate 
2) Create DB - minimal aurora 
3) Create ECS task definition to run a containerized app
4) Create ECS service that runs the task
5) Remote lookup to store the db url and automatically retrieve it in your ecs task
6) SG config to allow inbound and outbound traffic between ecs tasks and db
