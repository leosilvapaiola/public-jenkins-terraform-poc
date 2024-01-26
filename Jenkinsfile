pipeline {
    agent any
    environment {
        AWS_CREDENTIALS = credentials('aws-credentials-leo')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                dir('/var/lib/jenkins/workspace/jenkins-terraform-aws/') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Format') {
            steps {
                dir('/var/lib/jenkins/workspace/jenkins-terraform-aws/') {
                    sh 'terraform fmt -check=true'  // Use -check=true to check for format errors
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('/var/lib/jenkins/workspace/jenkins-terraform-aws/') {
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('/var/lib/jenkins/workspace/jenkins-terraform-aws/') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
    post {
        success {
            slackSend channel: '#notifications', color: 'good', message: 'Terraform deployment succeeded!'
        }
        failure {
            slackSend channel: '#notifications', color: 'danger', message: 'Terraform deployment failed.'
        }
    }
}
