pipeline{
     agent none
     stages{
        stage('scm'){
             agent{label 'master'} 
                    steps{
                       git 'https://github.com/105636046/gol12.git'
                         }
                    }
        stage('build'){
                    steps{
                       sh 'mvn package'
                         }
                      }
              }
     stages{ 
        stage('scm'){
            agent{label 'ansible'}
                    steps{
                      git 'https://github.com/105636046/gol.12.git'
                     }
                    }
        stage('terraform init'){
                    steps{
                       sh 'terraform init .'
                         }
                                }
        stage('terraform validate'){
                    steps{
                       sh 'terraform validate .'
                          }
                                    }
        stage('terraform apply'){
                    steps{
                       sh 'terraform apply .'
                         }
                                 }
                           }

            }


