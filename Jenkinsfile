pipeline{
    agent any

    environment{
        DOCKER_IMAGE = 'robi741/nxt-app'
        DOCKER_TAG = 'latest'
        DOCKER_PATH = 'containerization/nxt-app/.'
    }
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
                SONAR_SCANNER_OPTS = "-Xms512m -Xmx4096m"
            }
            steps{
                withSonarQubeEnv('sonarserver'){
                    sh '''
                    ${scannerHome}/bin/sonar-scanner  -Dsonar.projectKey=nxt-personal \
                    -Dsonar.projectName=nxt-personal \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=lib/public \
                    -Dsonar.language=php \
                    -Dsonar.sourceEncoding=UTF-8
                    '''
                }
            }
       }
//wait for quality gate result
       stage('Quality Gate'){
            steps{
                timeout(time: 1, unit: 'HOURS'){
                    waitForQualityGate abortPipeline: true
                }
            }
       }
//Build Docker Image And Push to Dockerhub
       stage('build docker image'){
        steps{
            script{
                docker.withRegistry('https://index.docker.io/v1/', 'docker-creds') {
                    def nxtApp = docker.build("$DOCKER_IMAGE:$env.BUILD_NUMBER", "--cpus=2 --memory=4g $DOCKER_PATH")
                    nxtApp.push()
            }
        }
       }       
    }
}
}