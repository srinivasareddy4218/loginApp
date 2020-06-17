FROM kpogadadanda/tomcat-alpine:1
copy loginApp /opt/loginApp
RUN apk update && apk add maven && cd /opt/loginApp && mvn clean package && cd target && cp -rf login.war /opt/apache-tomcat-8.5.53/webapps/
