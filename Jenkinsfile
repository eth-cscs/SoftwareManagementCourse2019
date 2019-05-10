pipeline {
    agent {label 'node1'}
    environment {
        PATH = "$PATH:/usr/local/cmake-3.14.3-Linux-x86_64/bin"
    }
    stages {
        stage('Configure') {
            steps {
                dir('cmake/handson/4_advanced/solution/dotprod/build') {
                    sh 'cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install -DCMAKE_CXX_FLAGS=-std=c++11'
                }
            }
        }
        stage('Build') {
            steps {
                dir('cmake/handson/4_advanced/solution/dotprod/build') {
                    sh 'make install'
                }
            }
        }
        stage('Test') {
            steps {
                dir('cmake/handson/4_advanced/solution/dotprod/build') {
                    sh 'make test'
                }
            }
        }
    }
}
