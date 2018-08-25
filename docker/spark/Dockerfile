FROM p7hb/docker-spark:2.2.0
MAINTAINER Dharma "dharmendra.singh4@cognizant.com"
WORKDIR /
ADD . /qispark
EXPOSE 8090
RUN apt-get install -y curl
RUN curl -uadmin:AP4gmeCaE21YNBpqadHAbH7ShLh -O "http://ec2-34-212-9-250.us-west-2.compute.amazonaws.com:8081/artifactory/generic-local/qi-latest/spark-job-server/spark-job-server-latest.jar" /qispark/spark-job-server.jar
RUN curl -uadmin:AP4gmeCaE21YNBpqadHAbH7ShLh -O "http://ec2-34-212-9-250.us-west-2.compute.amazonaws.com:8081/artifactory/generic-local/qi-latest/qi-bot/qi_bots_v1.jar" /qispark/qi_bots_v1.jar
    #Start the server
RUN chmod 777 /qispark/server_start.sh

ENTRYPOINT /qispark/server_start.sh && tail -f /dev/null



