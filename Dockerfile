# Use the official Tomcat image
FROM tomcat:9.0.96-jdk8-corretto

# Remove the default ROOT application in Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your application to the ROOT context
COPY ./target/mavenproject2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
