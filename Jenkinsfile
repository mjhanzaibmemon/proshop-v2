pipeline {
    agent any
    
    environment {
        NODE_ENV = 'production'
        PORT = 5000
        JWT_SECRET = 'abc123'
        PAYPAL_CLIENT_ID = 'your_paypal_client_id'
        PAGINATION_LIMIT = 8
        MONGO_URI = 'mongodb://mitesh:789456123@proshop-database.cluster-cy7opdotsam0.eu-west-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false'
        PAYPAL_APP_SECRET = 'your_paypal_secret'
        PAYPAL_API_URL = 'https://api-m.sandbox.paypal.com'
    }
    
    stages {
        stage('Source') {
            steps {
                git 'https://github.com/mjhanzaibmemon/proshop-v2'
            }
        }
        
        stage('Setup Node') {
            steps {
                script {
                    def nvmInstalled = sh(script: 'command -v nvm', returnStatus: true) == 0
                    echo "nvmInstalled"
                    echo $nvmInstalled
                    if (!nvmInstalled) {
                        sh 'command -v nvm || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'
                        sh '''
                            export NVM_DIR="${HOME}/.nvm"
                            [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
                        '''
                    }
                    sh 'nvm install 20'
                }
            }
        }
        
        stage('install') {
            steps {
                sh 'npm install'
                sh 'cd frontend && npm install'
            }
        }
        
        stage('build') {
            steps {
                sh 'cd frontend && npm run build'
               }
        }
        
        stage('deploy') {
            steps {
                sh 'npm run start'
            }
        }
    }
}

