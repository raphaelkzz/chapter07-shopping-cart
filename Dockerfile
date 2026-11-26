FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package

FROM tomcat:10.1-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/ROOT.war /usr/local/tomcat/webapps/ROOT.war
COPY docker/start.sh /usr/local/bin/start-cart
RUN chmod +x /usr/local/bin/start-cart
EXPOSE 10000
CMD ["/usr/local/bin/start-cart"]
