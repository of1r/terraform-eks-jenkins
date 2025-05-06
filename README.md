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

## Features
- **Infrastructure as Code**: Complete AWS infrastructure provisioning using Terraform
- **Containerized Deployments**: Kubernetes-based container orchestration
- **Automated CI/CD**: Jenkins pipeline for automated builds and deployments
- **High Availability**: EKS managed node groups for reliable container hosting
- **Security**: Properly configured VPCs, security groups, and IAM roles
- **Scalability**: Easy scaling with Kubernetes

## Project Structure
```
.
├── terraform/
│   ├── ec2-jenkins/    # Terraform configs for Jenkins EC2 instance
│   └── eks-cluster/    # Terraform configs for EKS cluster
├── manifests/          # Kubernetes deployment manifests
├── scripts/           # Installation and setup scripts
├── Jenkinsfile        # CI/CD pipeline definition
└── README.md
```

## Prerequisites

### Required Tools
- Terraform >= 1.5.0 (compatible with AWS provider >= 5.25.0)
- AWS CLI >= 2.0.0
- Git >= 2.0.0

### Other Requirements
- AWS account with appropriate permissions.
- GitHub repository with the project code.

## Setup Instructions

### 1. Initial Setup
```bash
# Clone the repository
git clone <repository-url>
cd terraform-eks-jenkins

# Configure AWS credentials
aws configure
```

### 2. Jenkins Setup
1. Navigate to terraform/ec2-jenkins directory
2. Update variables in terraform.tfvars
3. Run Terraform commands:
```bash
terraform init
terraform plan
terraform apply
```

### 3. EKS Cluster Deployment
1. Navigate to terraform/eks-cluster directory
2. Update cluster configuration in variables.tf
3. Deploy using Terraform:
```bash
terraform init
terraform plan
terraform apply
```

### 4. Jenkins Pipeline Configuration
1. Access Jenkins UI using the EC2 public IP
2. Install required plugins (AWS, Kubernetes, Pipeline)
3. Configure AWS credentials in Jenkins
4. Create and configure the pipeline job
5. Run the pipeline

## CI/CD Pipeline Stages
1. **Code Checkout**: Pull latest code from repository
2. **Infrastructure Validation**: Run Terraform plan
3. **Infrastructure Deployment**: Apply Terraform changes
4. **Application Deployment**: Deploy to EKS cluster
5. **Health Checks**: Verify deployment status

## Security Considerations
- AWS resources are deployed in private subnets
- Security groups are configured with minimal required access
- IAM roles follow the principle of least privilege
- Secrets are managed through AWS Secrets Manager
- Network policies are implemented for pod-to-pod communication

## Monitoring and Logging
- EKS control plane logging enabled
- CloudWatch container insights
- Prometheus and Grafana support (optional)

## Troubleshooting
- Check Jenkins logs for pipeline failures
- Verify AWS credentials and permissions
- Ensure correct kubectl context
- Review EKS cluster status and logs
- Check security group configurations

3. **Usage**:
   - Trigger the Jenkins pipeline to provision infrastructure and deploy the application.
   - Monitor the pipeline logs for deployment status.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Future Improvements
- Add automatic triggers for the Jenkins pipeline on code pushes.
- Implement testing stages in the pipeline.
- Add monitoring and logging solutions.