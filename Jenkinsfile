pipeline {
    agent {
        docker {
            image 'python:slim'
        }
    }
    stages {
        stage('Build') {
            steps {
                // Your build steps here
                sh 'python --version'
            }
        }
        // Add more stages if needed
    }
}
