# Terrafrom-Takeaway
Terraform Takeaway 
Create a ECS cluster and database in an existing VPC ( no need to write code for VPC) and the configuration must use remote data source to retrieve information from the resources to bind them 

1) Create ECS cluster using fargate 
2) Create DB - minimal aurora 
3) Create ECS task definition to run a containerized app
4) Create ECS service that runs the task
5) Remote lookup to store the db url and automatically retrieve it in your ecs task
6) SG config to allow inbound and outbound traffic between ecs tasks and db

# Explanation :
Firstly I created a VPC manually in my Aws console as I need to use it for my next task.
1. Created an ECS Cluster using Fargate, where I need to specify a region and cluster name intially.
2. Then First, retrieve the existing VPC and subnet details using a remote data source, and then created the Aurora DB. ( I always look Terraform Registry for any AWS documentaion )
3. In step 3 I created ECS Task definition. Here i need the container definitions.
4. Created ECS Service by using the network configuration, Here in network configuration I need to specify the security group configurations which includes inbound and outbound rules. So I created a SG-Configuration file to include the configurations ( step 6 )
7. Then I created the ECS-Task-Definition by getting all the parameters, so here the main thing is we need the AWS region & AWS account No. and then for that I created a AWS-info.tf file where I defined the variables and then created terraform.tfvars file to allocate them.
