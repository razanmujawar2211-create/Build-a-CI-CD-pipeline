pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

stage('SonarQube Analysis') {
    steps {
        withSonarQubeEnv('sonarqube') {
            withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_AUTH_TOKEN')]) {
                sh '''
                sonar-scanner \
                  -Dsonar.projectKey=ci-cd-demo \
                  -Dsonar.sources=. \
                  -Dsonar.host.url=http://localhost:9000 \
                  -Dsonar.login=squ_ea99a774fc03950b3cfcb9ab84484b823fbb8a34
                '''
            }
        }
    }
}

        stage('Build') {
            steps {
                echo 'Pretend we are building the app here...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Pretend deployment step...'
            }
        }
    }
}




