FROM tomcat:10.1-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY deploy/ROOT.war /usr/local/tomcat/webapps/ROOT.war
COPY docker/start.sh /usr/local/bin/start-cart
RUN chmod +x /usr/local/bin/start-cart
EXPOSE 10000
CMD ["/usr/local/bin/start-cart"]
