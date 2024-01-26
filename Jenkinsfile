pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out the repository"
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform"
                sh 'terraform init'
            }
        }
        stage('Terraform Format') {
            steps {
                echo "Checking Terraform formatting"
                sh 'terraform fmt -check=true'  // Use -check=true to check for format errors
            }
        }
        stage('Terraform Plan') {
            steps {
                echo "Running Terraform plan"
                script {
                    def terraformPlanOutput = sh(script: 'terraform plan', returnStatus: true).trim()
                    echo "Terraform Plan Output: ${terraformPlanOutput}"
                    if (terraformPlanOutput != 0) {
                        error "Terraform plan failed. Check the logs for details."
                    }
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                echo "Applying Terraform changes"
                sh 'terraform apply -auto-approve'
            }
        }
    }
    post {
        success {
            echo "Terraform deployment succeeded!"
            slackSend channel: '#notifications', color: 'good', message: 'Terraform deployment succeeded!'
        }
        failure {
            echo "Terraform deployment failed."
            slackSend channel: '#notifications', color: 'danger', message: 'Terraform deployment failed.'
        }
    }
}
