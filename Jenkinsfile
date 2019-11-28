

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
            sshagent(['ubuntu']) {
                sh "docker build -t ramram ."
                
                }
            
        }
    }
        
    }
}




                        
      








currentBuild.displayName = "declarative-pipeline-#"+currentBuild.number
