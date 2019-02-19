#!/usr/bin/env groovy

pipeline {
  agent none

  options {
    timestamps()
  }

  stages{
    stage('build') {
      agent { label 'master' }
      steps {
        sh '''
           echo Test succeeded? >build.out
           ls
           '''
        stash includes: 'build.out', name: 'build-stash'
        sh '''
           rm build.out
           ls
           '''
        echo 'Build succeeded.'
      }
    }
    stage('test1') {
      agent {
        docker { image 'alpine:3.7' }
      }
      steps {
        sh 'echo on alpine!'
      }
    }
    stage('test2') {
      agent { label 'master' }
      steps {
        unstash 'build-stash'
        sh '''
           ls
           more build.out
           '''
        archiveArtifacts 'build.out'
        echo 'Testing completed.'
      }
    }
  }
  post {
    always {
        echo 'finished'
    }
  }
}
