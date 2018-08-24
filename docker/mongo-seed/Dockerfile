FROM mongo:3.4

MAINTAINER Dharma "dharmendra.singh4@cognizant.com"

RUN mkdir -p /data/seed-data

COPY . /data/seed-data/

WORKDIR /data/seed-data/

CMD ./qimongo_import.sh