variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC for Jenkins"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the Jenkins VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins"
  type        = string
}