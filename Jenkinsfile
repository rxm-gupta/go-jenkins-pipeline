pipeline {
    agent any

    stages {
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

