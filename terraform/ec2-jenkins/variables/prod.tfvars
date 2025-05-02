aws_region = "eu-west-2"
aws_account_id = "your-account-id"
backend_jenkins_bucket = "jenkins-terraform-state-7001"
backend_jenkins_bucket_key = "jenkins/terraform.tfstate"
vpc_name       = "jenkins-vpc"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24"]
instance_type  = "t2.large"