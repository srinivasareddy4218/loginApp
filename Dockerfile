FROM kpogadadanda/tomcat-alpine:1
COPY loginApp /opt/loginApp
#RUN apk update && apk add maven && cd /opt/loginApp && mvn clean package && cd target && cp -rf login.war /opt/tomcat/webapps/
RUN apk update && apk add maven && cd /opt/loginApp && mvn clean package
EXPOSE 8080
