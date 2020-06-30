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
        stage('Deploy'){
                           steps{
                              sh 'terraform init' .
                              sh 'terraform validate' .
                              sh 'terraform apply' .
                                 }
                           }

            }
         }

