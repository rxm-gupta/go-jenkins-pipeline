pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/rxm-gupta/go-jenkins-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("go-jenkins-pipeline")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker run -d -p 8081:8080 go-jenkins-pipeline"
            }
        }
    }
}

