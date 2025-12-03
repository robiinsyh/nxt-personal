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

        stage('Build Message2'){
            steps{
                echo "Fuck with all of these"
            }
        }
        stage('Testing Build3'){
            steps{
                echo "Testing Build3"
            }
        }
    }
}