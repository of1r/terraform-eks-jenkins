pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-west-2"
    }
    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/of1r/terraform-eks-jenkins.git']])
                }
            }
        }
        stage('Initializing Terraform') {
            steps {
                script {
                    dir('terraform/eks-cluster') {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Validating Terraform') {
            steps {
                script {
                    dir('terraform/eks-cluster') {
                        sh 'terraform validate'
                    }
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    dir('terraform/eks-cluster') {
                        sh 'terraform plan -var-file=variables/dev.tfvars'
                    }
                    input(message: "Are you sure to proceed?", ok: "Proceed")
                }
            }
        }
        stage('Creating/Destroying EKS Cluster') {
            steps {
                script {
                    dir('terraform/eks-cluster') {
                        sh 'terraform $action -var-file=variables/dev.tfvars -auto-approve' 
                    }
                }
            }
        }
        stage('Deploying Nginx Application') {
            steps {
                script {
                    dir('manifests') {
                        sh 'aws eks update-kubeconfig --name my-eks-cluster'
                        sh 'kubectl create namespace eks-nginx-app'
                        sh 'kubectl apply -f deployment.yaml -n eks-nginx-app'
                        sh 'kubectl apply -f service.yaml -n eks-nginx-app'
                    }
                }
            }
        }
    }
}