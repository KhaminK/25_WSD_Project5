FROM tomcat:9.0

COPY src/main/webapp /usr/local/tomcat/webapps/ROOT/

CMD ["catalina.sh", "run"]