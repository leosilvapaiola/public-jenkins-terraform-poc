pipeline {
    agent any

    environment {
        TF_CLI_ARGS = "-input=false"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Clone your Terraform project repository
                    checkout scm
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Run 'terraform init'
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run 'terraform plan'
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Run 'terraform apply' with auto-approval
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        success {
            script {
                echo 'Terraform deployment successful!'
            }
        }
        failure {
            script {
                echo 'Terraform deployment failed!'
            }
        }
    }
}
