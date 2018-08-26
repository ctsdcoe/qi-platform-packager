FROM tomcat:8.0.20-jre8
MAINTAINER Dharma "dharmendra.singh4@cognizant.com"
RUN apt-get install -y wget
RUN wget --user admin --password AP4gmeCaE21YNBpqadHAbH7ShLh "http://ec2-34-212-9-250.us-west-2.compute.amazonaws.com:8081/artifactory/generic-local/qi-latest/qi-platform/QualityBot1.war"  -O /tmp/QualityBot1.war
RUN ls -al /tmp
COPY /tmp/QualityBot1.war /usr/local/tomcat/webapps/QualityBot1.war
