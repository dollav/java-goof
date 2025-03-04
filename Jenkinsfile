pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dollav/java-goof.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests' // Skip tests for a faster build, remove -DskipTests to run tests.
            }
        }

        stage('Download Snyk CLI') {
            steps {
                sh '''
                    curl -Lo ./snyk https://downloads.snyk.io/cli/stable/snyk-linux-arm64
                    chmod +x snyk
                    ls -la
                    ./snyk -v
                '''
            }
        }


        stage('Snyk Scan') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'API_TOKEN')]){
                    sh """
                    ./snyk auth $API_TOKEN
                    ./snyk test --all-projects
                    """
                    }
                }
            }
        }
        
    
        stage('Publish') {
            steps {
                // Example: Publish to a Maven repository
                // You'll need to configure your Maven settings and credentials
                // sh 'mvn deploy'
                echo 'Publish stage - configure as needed'
            }
        }

    }
    post {
        always {
            cleanWs() // Clean the workspace after each build
        }
    }
}