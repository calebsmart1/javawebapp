# Use Tomcat 11 base image
FROM tomcat:11-jdk17-openjdk

# Clean up default web apps and temporary files
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to Tomcat's webapps directory
COPY ./target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
