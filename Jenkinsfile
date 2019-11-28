

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
        stage("Deploy"){
            steps{
                sshagent(['ubuntu']) {
                    
                    sh """
                        scp -o StrictHostKeyChecking=no target/dad-{$env.BUILD_NUMBER}.war ubuntu@172.31.39.220:/opt/apache-tomcat-7.0.96/webapps/
                        ssh root@172.31.39.220 /opt/apache-tomcat-7.0.96/bin/shutdown.sh
                        ssh root@172.31.39.220 /opt/apache-tomcat-7.0.96/bin/startup.sh

                    """
                
        
            }
            }
            
        }
        stage("docker Image") {
        
        steps {
            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker_server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker build -t ramram .', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//opt//docker', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        }
       
        }
        
    }
}




                        
      








currentBuild.displayName = "declarative-pipeline-#"+currentBuild.number
