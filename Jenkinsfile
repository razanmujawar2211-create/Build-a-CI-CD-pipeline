pipeline {
    agent any

    environment {
        REGISTRY = "docker.io/razanmujawar2211"   // replace with your DockerHub username
        IMAGE_NAME = "ci-cd-demo"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo " Checkout stage completed"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
                echo " Dependencies installed successfully"
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh '''
                        sonar-scanner \
                          -Dsonar.projectKey=ci-cd-demo \
                          -Dsonar.sources=. \
                          -Dsonar.host.url=http://localhost:9000 \
                          -Dsonar.login=$SONARQUBE_AUTH_TOKEN
                    '''
                }
                echo " SonarQube analysis completed"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t $REGISTRY/$IMAGE_NAME:latest -f Dockerfile .
                    docker push $REGISTRY/$IMAGE_NAME:latest
                '''
                echo " Docker image built and pushed successfully"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/'
                echo " Deployment to Kubernetes completed"
            }
        }
    }
}
