terraform {
  backend "s3" {
    bucket = "terraform-eks-cicd-4320"
    key    = "eks/terraform.tfstate"
    region = "eu-west-2"
  }
}