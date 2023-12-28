pipeline {
    agent any
    stages {
        stage('Debug') {
            steps {
                echo 'Starting pipeline execution...'
                sh 'env'
            }
        }
        stage('Check Environment') {
            steps {
                echo 'Checking Environment...'
                sh 'docker ps'
            }
        }
        stage('Build and Deploy Locally') {
            steps {
                sh '''
                    docker build -t nginx-proxy .
                    docker stop nginx-proxy-container || true
                    docker rm nginx-proxy-container || true

                    docker run -d -p 80:80 -p 443:443 \
                        --name nginx-proxy-container \
                        --network intervolz-network \
                        -v /etc/letsencrypt/live/intervolz.com/fullchain.pem:/etc/nginx/ssl/intervolz.com/fullchain.pem:ro \
                        -v /etc/letsencrypt/live/intervolz.com/privkey.pem:/etc/nginx/ssl/intervolz.com/privkey.pem:ro \
                        -v /etc/letsencrypt/live/bigbadassdude.com/fullchain.pem:/etc/nginx/ssl/bigbadassdude.com/fullchain.pem:ro \
                        -v /etc/letsencrypt/live/bigbadassdude.com/privkey.pem:/etc/nginx/ssl/bigbadassdude.com/privkey.pem:ro \
                        nginx-proxy
                '''
            }
        }
        stage('Verification') {
            steps {
                echo 'Deployment complete. Notifying stakeholders for verification.'
                // Add steps for notification or health check
            }
        }
    }
}
