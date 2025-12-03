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
    }
}