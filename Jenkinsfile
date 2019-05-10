pipeline {
    agent {label 'scs_daintvm1'}
    stages {
        stage('test') {
            steps {
                sh '''#!/bin/bash -l
                      sbatch --wait sbatch_test.sh
                      cat test.out'''
            }
        }
    }
}
