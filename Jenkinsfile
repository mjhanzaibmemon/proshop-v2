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
        
        stage('install') {
            steps {
                sh '''
                        export PATH=$PATH:/var/lib/jenkins/.nvm/versions/node/v20.11.1/bin/
                        npm install && cd frontend && npm install
                '''
            }
        }
        
        stage('build') {
            steps {
                sh '''
                        export PATH=$PATH:/var/lib/jenkins/.nvm/versions/node/v20.11.1/bin/
                        cd frontend && npm run build
                '''
               }
        }

        stage('stop old version') {
            steps {
                sh '''
                        export PATH=$PATH:/var/lib/jenkins/.nvm/versions/node/v20.11.1/bin/pm2/
                        
                        if pm2 list | grep -q "online"; then
                            echo "Deleting all pm2 processes."
                            pm2 delete all
                        else
                            echo "No processes found to stop."
                        fi
                '''
            }
        }

        stage('deploy') {
            steps {
                sh '''
                        export PATH=$PATH:/var/lib/jenkins/.nvm/versions/node/v20.11.1/bin/pm2/
                        pm2 start npm -- start
                '''
            }
        }
    }
}
