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
           }
     }
