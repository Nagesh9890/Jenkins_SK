pipeline {
  agent any
  stages {
    stage('version is wrong and true also ') {
      steps {
        sh 'python3 --version'
      }
    }
    stage('Install Dependencies') {
      steps {
        sh 'pip3 install -r requirements.txt'
      }
    }
    stage('Python Build') {
      steps {
        sh 'python3 app.py'
      }
    }
  }
}
