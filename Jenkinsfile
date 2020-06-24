pipeline {
  environment {
     registry = "srinivasareddy4218/docker-kubernetes"
    registryCredential = 'Dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git credentialsId: 'jenkins', url: 'https://github.com/srinivasareddy4218/loginApp.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Building image push') {
      steps{
        script {
          withCredentials([string(credentialsId:'DockerPWD',variable:'DockerPWD')]){
            sh "docker login -u srinivasareddy4218 -p ${DockerPWD}"
          sh "docker push srinivasareddy4218/docker-kubernetes:${DOCKER_TAG}"
        }
       }   
      }
    }
   
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
