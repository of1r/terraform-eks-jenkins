# End-to-End EKS Deployment with Jenkins CI/CD & Terraform

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white)](https://www.jenkins.io/)
[![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview
This project demonstrates a full Infrastructure-as-Code (IaC) and CI/CD workflow using Terraform, Jenkins, and AWS EKS. It automates the provisioning of a Jenkins server on EC2, an EKS cluster, and the deployment of a sample Nginx application.

## Architecture

![EKS Jenkins Architecture](./assets/architecture.png)

## Project Structure
- **terraform/ec2-jenkins/**: Terraform scripts to provision an EC2 instance for Jenkins, including VPC, subnets, and security groups.
- **terraform/eks-cluster/**: Terraform scripts to create an EKS cluster with its own VPC and managed node groups.
- **manifests/**: Kubernetes manifests for deploying the Nginx application.
- **scripts/**: Bootstrap scripts for installing necessary tools on the EC2 instance.
- **Jenkinsfile**: Defines the CI/CD pipeline for automating infrastructure and application deployment.

## Prerequisites

### Required Tools
- Terraform >= 1.5.0 (compatible with AWS provider >= 5.25.0)
- AWS CLI >= 2.0.0
- Git >= 2.0.0

### Other Requirements
- AWS account with appropriate permissions.
- GitHub repository with the project code.

## Workflow
1. **Infrastructure Provisioning**:
   - Terraform provisions an EC2 instance for Jenkins and an EKS cluster.
   - The EC2 instance is bootstrapped with Jenkins, Docker, Git, AWS CLI, Terraform, kubectl, and Helm.

2. **CI/CD Pipeline**:
   - Jenkins checks out the latest code from the repository.
   - Terraform is initialized, validated, and planned for the EKS cluster.
   - After manual approval, Terraform applies changes to create/update the EKS cluster.
   - The Nginx application is deployed to the EKS cluster using Kubernetes manifests.

3. **Application Deployment**:
   - Jenkins uses kubectl to update the kubeconfig, create a namespace, and deploy the Nginx app and its service.

## CI/CD Explanation
- **Continuous Integration (CI)**: The Jenkins pipeline automates the process of checking out code, validating infrastructure, and planning changes. However, it currently requires manual triggering.
- **Continuous Delivery/Deployment (CD)**: The pipeline automatically deploys the application to the EKS cluster after infrastructure changes are applied.

## Setup Instructions
1. **Prerequisites**:
   - AWS account with appropriate permissions.
   - GitHub repository with the project code.

2. **Installation**:
   - Clone the repository.
   - Configure AWS credentials in Jenkins.
   - Run the Jenkins pipeline manually or set up a trigger for automatic builds.

3. **Usage**:
   - Trigger the Jenkins pipeline to provision infrastructure and deploy the application.
   - Monitor the pipeline logs for deployment status.

## Why Use This Setup?
- **Automation**: Ensures consistent and error-free deployments.
- **Version Control Integration**: Keeps infrastructure and application code in sync.
- **Audit Trail**: Provides logs and history of all deployments.
- **Team Collaboration**: Enables team members to trigger deployments and review logs.
- **Extensibility**: Easily add more stages for testing, notifications, and multi-environment deployments.

## Future Improvements
- Add automatic triggers for the Jenkins pipeline on code pushes.
- Implement testing stages in the pipeline.
- Add monitoring and logging solutions.