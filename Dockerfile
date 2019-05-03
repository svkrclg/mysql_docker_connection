FROM tomcat:9.0.1-jre8-alpine

ADD ./jsp /usr/local/tomcat/webapps/webapp
COPY mysql-connector-java-5.1.47-bin.jar /usr/local/tomcat/lib/

CMD ["catalina.sh", "run"]
