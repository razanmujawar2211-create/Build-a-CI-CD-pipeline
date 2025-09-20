pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/razanmujawar2211-create/Build-a-CI-CD-pipeline.git'
            }
        }

stage('SonarQube Scan') {
    steps {
        withSonarQubeEnv('SonarQube') {
            sh """
                ${tool 'SonarQubeScanner'}/bin/sonar-scanner \
                -Dsonar.projectKey=ci-cd-demo \
                -Dsonar.sources=. \
                -Dsonar.host.url=http://localhost:9000
            """
        }
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


