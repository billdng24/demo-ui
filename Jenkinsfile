pipeline {
    agent any

    environment {
        DOCKER_HUB = "your-dockerhub-username"
    }

    stages {
        stage('Install Node and Tools') {
            steps {
                sh 'curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -'
                sh 'sudo apt-get install -y nodejs'
                sh 'corepack enable'
                sh 'corepack prepare pnpm@latest --activate'
            }
        }

        stage('Install Deps') {
            steps {
                sh 'pnpm install'
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