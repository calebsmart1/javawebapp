# Use OpenJDK 17 as the base image
FROM openjdk:17-slim

# Install required dependencies and download Tomcat 11
RUN apt-get update && apt-get install -y wget && \
    wget https://downloads.apache.org/tomcat/tomcat-11/v11.0.0-M9/bin/apache-tomcat-11.0.0-M9.tar.gz && \
    tar -xvf apache-tomcat-11.0.0-M9.tar.gz && \
    mv apache-tomcat-11.0.0-M9 /usr/local/tomcat && \
    rm apache-tomcat-11.0.0-M9.tar.gz

# Clean up the default web apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to Tomcat's webapps directory
COPY ./target/mavenproject2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Set environment variables for Tomcat
ENV CATALINA_HOME=/usr/local/tomcat

# Start Tomcat
CMD ["sh", "/usr/local/tomcat/bin/catalina.sh", "run"]
