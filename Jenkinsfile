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
       stage('Sonarqube Anlysis'){
            environment{
                scannerHome = tool 'sonar6.2'
                SONAR_SCANNER_OPTS = "-Xmx1024m"
            }
            steps{
                withSonarQubeEnv('sonarserver'){
                    sh '''
                    ${scannerHome}/bin/sonar-scanner  -Dsonar.projectKey=nxt-personal \
                    -Dsonar.projectName=finance-note \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=. \
                    -Dsonar.language=php \
                    -Dsonar.sourceEncoding=UTF-8
                    '''
                }
            }
       }       
    }
}