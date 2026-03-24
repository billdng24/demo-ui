pipeline {
    agent any

    environment {
        DOCKER_HUB = "nguyenbill"
    }

    stages {
        stage('Build App') {
            agent {
                docker {
                    image 'node:lts'
                    args '-u root'
                }
            }
            steps {
                sh 'corepack enable'
                sh 'corepack prepare pnpm@latest --activate'
                sh 'pnpm install'
                sh 'pnpm build'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_HUB}/nextjs-app:latest")
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-creds') {
                        docker.image("${DOCKER_HUB}/nextjs-app:latest").push()
                    }
                }
            }
        }
    }
}