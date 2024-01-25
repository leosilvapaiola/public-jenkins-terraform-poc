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
                sh 'terraform init'
            }
        }
        stage('Terraform Format') {
            steps {
                sh 'terraform fmt -check=true'  // Use -check=true to check for format errors
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
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