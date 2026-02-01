pipeline {
    agent any

    parameters {
        string(name: 'ENV_NAME', defaultValue: 'testing', description: 'Nama namespace / environment')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Apply atau Destroy environment')
    }

    tools {
        terraform 'terraform-default'
    }

    environment {
        TF_IN_AUTOMATION = 'true'
    }

    stages {

        stage('Check Terraform') {
            steps {
                sh '''
                  echo "Terraform path:"
                  which terraform || true
                  terraform version
                '''
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
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                dir('terraform') {
                    sh "terraform plan -var=\"env_name=${params.ENV_NAME}\""
                }
            }
        }

        stage('Terraform Apply / Destroy') {
            steps {
                dir('terraform') {
                    sh """
                      if [ "${params.ACTION}" = "apply" ]; then
                        terraform apply -auto-approve -var="env_name=${params.ENV_NAME}"
                      else
                        terraform destroy -auto-approve -var="env_name=${params.ENV_NAME}"
                      fi
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Environment '${params.ENV_NAME}' berhasil di-${params.ACTION}"
        }
        failure {
            echo "❌ Terraform ${params.ACTION} gagal untuk environment: ${params.ENV_NAME}"
        }
        always {
            cleanWs()
        }
    }
}
