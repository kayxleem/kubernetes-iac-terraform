#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-west-2"
    }
    stages {
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('deployment') {
                        sh "aws eks --region us-west-2 update-kubeconfig --name finalexamproject"
                        sh "kubectl apply -f mongo-secret.yaml"
                        sh "kubectl apply -f mongo.yaml"
                        sh "kubectl apply -f mongo-configmap.yaml"
                        sh "kubectl apply -f mongo-express.yaml"
                    }
                }
            }
        }
    }
}