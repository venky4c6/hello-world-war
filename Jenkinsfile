

pipeline{
    agent any
    stages{
        stage("Git Checkout"){
            steps{
                
                git 'https://github.com/venky4c6/hello-world-war'
               
                }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean install package"
                sh "mv target/*.war target/dad-{$env.BUILD_NUMBER}.war"
            }
        }
        
        stage("docker Image") {
        
        steps {
            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sudo docker build -t ramram .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])}
       
        }
        
    }
}




                        
      








currentBuild.displayName = "declarative-pipeline-#"+currentBuild.number
