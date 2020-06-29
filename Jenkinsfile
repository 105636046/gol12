node('master') {
    // some block

      stage('scm') {
            // some block
          git 'https://github.com/105636046/gol12.git'
}
      stage('build') {
            // some block
          sh label: '', script: 'mvn package'
}
      stage('post build') {
            // some block
          junit 'gameoflife-web/target/surefire-reports/*.xml'
          archiveArtifacts 'gameoflife-web/target/*.war'
}


     terraform init .
     terraform validate .
     terraform apply .

}}
