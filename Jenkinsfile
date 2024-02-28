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
        EC2_INSTANCE_IP = '3.110.105.99' // Replace with your EC2 instance IP
    }
    
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
                sh 'npm run build'
                sh 'cd frontend && npm install'
            }
        }
        
        stage('Import Data') {
            steps {
                sh 'npm run data:import'
            }
        }
        
        stage('Rename .env.example to .env') {
            steps {
                sh 'mv .env.example .env'
            }
        }
        
        stage('Run Backend & Frontend') {
            steps {
                sh 'npm run dev'
            }
        }
        
        stage('Deploy Frontend') {
            steps {
                sh 'cd frontend && npm run build'
                // Additional deployment steps for the frontend
                sh 'scp -r frontend/build/* ubuntu@3.110.105.99:/var/www/frontend'

            }
        }
        
        stage('Run Backend Only') {
            steps {
                sh 'npm run server'
            }
        }
        
        stage('Deploy Backend') {
            steps {
                // Additional deployment steps for the backend
                // For example, copy backend files to the EC2 instance
                sh 'scp -r backend/* ubuntu@${EC2_INSTANCE_IP}:/var/www/backend'
            }
        }
    }
}
