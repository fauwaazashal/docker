pipeline{
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Deleting image and container') {
            steps{
                script {
                    sh "docker rm -f my-app"
                    sh "docker rmi -f fauwaaz/my-app"
                }
            }
        }
        stage('Build Maven') {
            steps{
                git branch: 'main', url: 'https://github.com/fauwaazashal/docker.git'

                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t fauwaaz/my-app .'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                 withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'test1', usernameVariable: 'test')])  {
                    sh 'docker login -u ${test} -p ${test1}'
                 }  
                 sh 'docker push fauwaaz/my-app'
                }
            }
        }
        // stage('Run Container on Server') {
        //     steps {
        //         sh """
        //           docker run -d --name my-app --restart unless-stopped -p 4001:8080 fauwaaz/my-app
        //         """
        //     }
        // }
        stage('Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
                }
            }
        }
    }
}
