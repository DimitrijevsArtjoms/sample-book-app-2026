pipeline {
    agent any
    parameters {
         string(name: 'NAME', defaultValue: 'worrld', description: '')
    }

    stages {
        stage('Hello') {
            steps {
                echo "Hello ${params.NAME}!!"
            }
        }
    }
}
