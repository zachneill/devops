FROM jenkins/jenkins:2.485-rhel-ubi9-jdk21
# Install necessary packages and Jenkins plugins
USER root
RUN microdnf -y update && \
    microdnf -y install git maven && \
    microdnf clean all
# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "git maven"

# Set the working directory
WORKDIR /var/jenkins_home
# Expose Jenkins port
EXPOSE 8080
# Start Jenkins

USER jenkins

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]