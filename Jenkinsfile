pipeline {
    agent none

    environment {
        DOCKER_HUB = "your-dockerhub-username"
    }

    stages {
        stage('Install + Build Frontend') {
            agent {
                docker {
                    image 'node:lts'
                }
            }
            steps {
                sh 'corepack enable'
                sh 'corepack prepare pnpm@latest --activate'
                sh 'pnpm install --frozen-lockfile'
                sh 'pnpm lint || true'
                sh 'pnpm tsc'
                sh 'pnpm build'
            }
        }

        stage('Build Docker Image') {
            agent any
            steps {
                sh 'docker build -t $DOCKER_HUB/nextjs-app:latest .'
            }
        }

        stage('Push Image') {
            agent any
            steps {
                sh 'docker push $DOCKER_HUB/nextjs-app:latest'
            }
        }
    }
}