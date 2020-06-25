node {
    
    stage('scm') {
    
        git 'https://github.com/shaikkhajaibrahim/game-of-life.git'
    }
    
    stage('packaging'){
        sh 'mvn package'    
    }
    stage('postbuild'){
       junit '/game of life pipe/target/surefire-reports/.xml'
       }
 
}
