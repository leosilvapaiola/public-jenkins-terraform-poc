pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                dir('/path/to/terraform/files') {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Format') {
            steps {
                dir('/path/to/terraform/files') {
                    sh 'terraform fmt -check=true'  // Use -check=true to check for format errors
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir('/path/to/terraform/files') {
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir('/path/to/terraform/files') {
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
