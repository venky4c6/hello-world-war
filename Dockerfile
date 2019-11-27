
FROM tomcat:8.0-alpine

LABEL maintainer="deepak@softwareyoga.com"

ADD target/dad.war /opt/

EXPOSE 8080

CMD ["catalina.sh", "run"]
