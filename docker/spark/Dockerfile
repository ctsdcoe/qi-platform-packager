FROM p7hb/docker-spark:2.2.0
MAINTAINER Dharma "dharmendra.singh4@cognizant.com"
WORKDIR /
ADD . /qispark
EXPOSE 8090
RUN apt-get install -y wget \
    && wget --user admin --password AP4gmeCaE21YNBpqadHAbH7ShLh "http://ec2-34-212-9-250.us-west-2.compute.amazonaws.com:8081/artifactory/generic-local/qi-latest/spark-job-server/spark-job-server-latest.jar" -O /qispark/spark-job-server.jar \
    && wget --user admin --password AP4gmeCaE21YNBpqadHAbH7ShLh "http://ec2-34-212-9-250.us-west-2.compute.amazonaws.com:8081/artifactory/generic-local/qi-latest/qi-bot/qi_bots_v1.jar" -O /qispark/qi_bots_v1.jar \
    && chmod +x /qispark/*.jar

ENTRYPOINT chmod +x /qispark/server_start.sh && /qispark/server_start.sh && tail -f /dev/null



