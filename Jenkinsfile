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
                    deploy("DEV", 1010)
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
                    deploy("STG", 2020)
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
                    deploy("PRD", 3030)
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

// def deploy(String environment) {
//     echo "Deployment to ${environment} environment has started.."
//     echo "Deployment to ${environment} environment finished.."
// }

def deploy(String environment, int port) {
    echo "Deployment to ${environment} environment has started.."
    powershell ".\\node_modules\\.bin\\pm2 delete \"books-${environment}\" || exit 0"
    powershell ".\\node_modules\\.bin\\pm2 start -n \"books-${environment}\" index.js -- -- ${port}"
    echo "Deployment to ${environment} environment finished.."



    // echo "Deployment to ${environment} environment has started.."
    // //powershell "pm2 start -n \"${environment}\" index.js -- ${port}"
    // // bat "node_modules\\.bin\\pm2 delete \"$books-{environment}\" || exit 0"
    // // bat "node_modules\\.bin\\pm2 start -n \"$books-{environment}\" index.js -- ${port}"
    // bat "node_modules\\.bin\\pm2 reload \"books-${environment}\" index.js -- ${port}"
    // echo "Deployment to ${environment} environment finished.."
}

def test(String environment) {
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    echo "Testing Sample Book Application service finished.."
}

