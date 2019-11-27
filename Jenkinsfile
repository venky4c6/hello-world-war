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
                sh "mv target/*.war target/dad.war"
            }
        }
        stage("Deploy"){
            steps{
                sshagent(['5c657533-ae01-479e-a08f-9dc6fd7f6581']) {
                    
                    sh """
                        scp -o StrictHostKeyChecking=no target/dad.war ansadmin@172.31.39.220:/opt/apache-tomcat-7.0.96/webapps/
                        ssh ansadmin@172.31.39.220 /opt/apache-tomcat-7.0.96/bin/shutdown.sh
                        ssh ansadmin@172.31.39.220 /opt/apache-tomcat-7.0.96/bin/startup.sh

                    """
                
        
            }
            }
            
        }
        
    }
}
