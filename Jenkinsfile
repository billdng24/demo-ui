pipeline {
    agent any

    environment {
        DOCKER_HUB = "your-dockerhub-username"
    }

    stages {
        stage('Install Deps') {
            steps {
                sh 'corepack enable'
                sh 'corepack prepare pnpm@latest --activate'
                sh 'pnpm install --frozen-lockfile'
            }
        }

        stage('Lint + Type Check') {
            steps {
                sh 'pnpm lint || true'
                sh 'pnpm tsc'
            }
        }

        stage('Build') {
            steps {
                sh 'pnpm build'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_HUB/nextjs-app:latest .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $DOCKER_HUB/nextjs-app:latest'
            }
        }
    }
}