FROM p7hb/docker-spark:2.2.0
MAINTAINER Dharma "dharmendra.singh4@cognizant.com"
WORKDIR /
ADD . /qispark
EXPOSE 8090

#Start the server
RUN chmod 777 /qispark/server_start.sh

ENTRYPOINT /qispark/server_start.sh && tail -f /dev/null



