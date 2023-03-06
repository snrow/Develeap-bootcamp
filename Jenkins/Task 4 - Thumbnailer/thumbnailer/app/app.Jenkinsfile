// def server = Artifactory.newServer url: 'http://artifactory:8081', username: 'admin', password: 'password'


pipeline {
    agent any
      tools {
      maven 'maven-3.6.2'
      jdk 'jdk8'
      }
      options {
        gitLabConnection('gitlabConnection')
      }
      triggers {
        gitlab(triggerOnPush:true, branchFilterType: 'All')
        }

    environment {
      gitLabCredentials = credentials ('gitlabCreds')
    }

  stages {
        stage('Checkout'){
          steps {
            cleanWs()
            checkout scm
           }
          }      
    stage('Initialize'){
        steps {
            sh '''
              echo "PATH = ${PATH}"
              echo "M2_HOME = ${M2_HOME}"
            '''
           }
         }      
        stage ('Build') {
          steps {
            sh 'mvn install' 
            // configFileProvider([configFile(fileId: 'MVN_artifactory', targetLocation: 'target', variable: 'VAR')]) {
            // sh 'mvn -U --batch-mode -s $VAR deploy'
            // } 
          }
          //   post {
          //     success {
          //       sh 'mvn deploy'
          //     }
          // }
        }
        
    // stage('Checkout'){
    //     steps {
    //        cleanWs()
    //        checkout scm
    //      }
    //   }      

    // stage('config Gitlab'){
    //   steps{
    //     script{
    //         sh"""
    //         #!/bin/sh/
    //         git config --local credential.helper '!f() echo username=\\$gitLabCredentials_USR; echo password=\\$gitLabCredentials_PSW; f' 
    //         git config --global user.email "you@example.com"
    //         git config --global user.name "cowsay_developer"
    //     """
    //     }}}
  }
}