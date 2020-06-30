pipeline{
     agent(any)
     stages{
        stage('scm'){
                    steps{
                       git 'https://github.com/105636046/gol12.git'
                         }
                    }
        stage('build'){
                    steps{
                       sh 'mvn package'
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
