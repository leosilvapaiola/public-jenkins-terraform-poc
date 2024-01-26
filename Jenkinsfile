pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = 'AKIAUAA7GSTNVKGTUPIF'
        AWS_SECRET_ACCESS_KEY = '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'
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
