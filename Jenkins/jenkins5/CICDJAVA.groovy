mavenJob('CICD') {
    jdk('java-8')
    scm {
      git {
     remote {
       url('https://github.com/tarungoel1995/ContinuousIntegration.git')
     }
      branch("*/master")
     }
    }       

  goals('clean install') 
  goals('findbugs:findbugs') 
  goals('checkstyle:checkstyle') 
  goals('cobertura:cobertura')
       rootPOM("Spring3HibernateApp/pom.xml")
        mavenInstallation('mvn-3.5.3')
  
 postBuildSteps('SUCCESS') {
   	  shell('sudo systemctl stop tomcat.service')
      shell('sudo cp Spring3HibernateApp/target/Spring3HibernateApp.war /opt/tomcat/webapps/')
   	  shell('sudo systemctl start tomcat.service')
 }
}
