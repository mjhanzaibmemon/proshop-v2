pipeline {
    agent any
    
    environment {
        NODE_ENV = 'production'
        PORT = '5000'
        MONGO_URI = 'mongodb://jhanzaib:46150786@proshop.cluster-cpq82sy4a049.ap-south-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false'
        JWT_SECRET = 'abc123'
        PAYPAL_CLIENT_ID = 'your_paypal_client_id'
        PAGINATION_LIMIT = '8'
        PAYPAL_APP_SECRET = 'your_paypal_secret'
        PAYPAL_API_URL = 'https://api-m.sandbox.paypal.com'
    }
    
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
                sh 'cd frontend && npm install'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'cd frontend && npm run build'
                // Additional deployment steps for the frontend
            }
        }

        stage('Run Server') {
            steps {
                sh 'npm run start'
            }
        }
    }
}
