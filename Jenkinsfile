

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
                        scp -o StrictHostKeyChecking=no target/Dockerfile ubuntu@172.31.29.23:/opt/docker
                        docker build -t ramram .

                    """
                
        
            }
            }
            
        }
}

}
