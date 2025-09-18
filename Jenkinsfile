pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "razan2211/ci-cd-demo:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/razanmujawar2211/Build-a-CI-CD-pipeline.git'
            }
        }

        stage('SonarQube Scan') {
            steps {
                echo "SonarQube scan would run here (configure SonarQube later)"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}
