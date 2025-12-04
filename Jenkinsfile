pipeline{
    agent any

    stages{
        stage('Fetch Code'){
            steps{
                git branch: 'main', url:'https://github.com/robiinsyh/nxt-personal.git'
            }
        }

        stage('Build Message'){
            steps{
                echo "Building Nextcloud Personal Edition Docker Image"
            }
        }
        stage('analyze code with sonarQube'){
            withSonarQubeEnv('sonarserver'){
                sh '''
                    ${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=nxt-personal \
                    -Dsonar.projectName="nxt-personal" \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=. \
                    -Dsonar.sourceEncoding=UTF-8 \
                '''
            }
        }

        stage('Quality Gate'){
            steps{
                timeout(time: 1, unit: 'MINUTES'){
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        
    }
}