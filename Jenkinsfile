pipeline {
    agent any



    triggers {
        pollSCM('*/1 * * * *')
    }

    stages {
        stage('build-install-deps') {
            steps {
                script{
                    build()
                }
            }
        }
        stage('deploy-dev') {
            steps {
                script{
                    deploy("DEV", 3000)
                }
            }
        }
        stage('test-dev') {
            steps {
                script{
                    test("DEV")
                }
            }
        }
        stage('deploy-stg') {
            steps {
                script{
                    deploy("STG", 3000)
                }
            }
        }
        stage('test-stg') {
            steps {
                script{
                    test("STG")
                }
            }
        }
        stage('deploy-prd') {
            steps {
                script{
                    deploy("PRD", 3000)
                }
            }
        }
        stage('test-prd') {
            steps {
                script{
                    test("PRD")
                }
            }
        }
    }
}


// Būvējuma izveidi;
// Būvējuma izvietošanu “DEV” vidē;
// Testu izpildi “DEV” vidē;
// Būvējuma izvietošanu “STG” vidē;
// Testu izpildi “STG” vidē;
// Būvējuma izvietošanu “PRD” vidē;
// Testu izpildi “PRD” vidē;


def build() {
    echo "Installing all necessary node dependencies.."
    powershell 'npm install'
    powershell 'ls'
    echo "Dependencies fully installed.."
}

def deploy(String environment) {
    echo "Deployment to ${environment} environment has started.."
    echo "Deployment to ${environment} environment finished.."
}

def deploy(String environment, int port) {
    echo "Deployment to ${environment} environment has started.."
    powershell "pm2 start -n \"${environment}\" index.js --port ${port}"
    echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    echo "Testing Sample Book Application service finished.."
}

