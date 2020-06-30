pipeline{
     node(any)
     stages{
        stage('scm'){
	    git 'https://github.com/105636046/gol12.git'
	  }
	stage('build'){
            sh 'mvn package'
	    }
	   } 

     }
