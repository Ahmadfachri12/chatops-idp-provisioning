pipeline {
    agent any

    parameters {
        string(
            name: 'ENV_NAME',
            defaultValue: 'dev',
            description: 'Nama environment (contoh: dev, staging, prod)'
        )

        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Terraform action'
        )
    }

    stages {

        stage('Validasi Environment') {
            steps {
                script {
                    def allowedEnv = ['dev', 'staging', 'prod']
                    if (!allowedEnv.contains(params.ENV_NAME)) {
                        error "Environment '${params.ENV_NAME}' tidak valid. Gunakan: dev, staging, atau prod."
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh "terraform plan -var=\"env_name=${params.ENV_NAME}\""
                }
            }
        }

        stage('Terraform Apply / Destroy') {
            steps {
                dir('terraform') {
                    sh "terraform ${params.ACTION} -auto-approve -var=\"env_name=${params.ENV_NAME}\""
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform ${params.ACTION} berhasil untuk environment: ${params.ENV_NAME}"
        }

        failure {
            echo "❌ Terraform ${params.ACTION} gagal untuk environment: ${params.ENV_NAME}"
        }

        always {
            cleanWs()
        }
    }
}
