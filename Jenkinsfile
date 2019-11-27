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
            sshagent(['4e9b6541-7bd9-4045-83b7-95e06296fd0a']) {
                sh """
                    scp -o StrictHostKeyChecking=no target/dad.war ansadmin@172.31.39.220:/opt/apache-tomcat-7.0.96/webapps/
                    ssh ansadmin@172.31.39.220 /opt/apache-tomcat-7.0.96/bin/shutdown.sh
                    ssh ansadmin@172.31.39.220 /opt/apache-tomcat-7.0.96/bin/startup.sh
                
                """
                
        
            }
        }
        
    }
}
