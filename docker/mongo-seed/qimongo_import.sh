#!/bin/bash
# Sleep for 1 minute so al the db executions finihes
sleep 60
mongoimport  --host mongodb --username qi-botuser --password bot123 --db QualityInsightDB --collection subMenuItems --file subMenuItems.json
mongoimport  --host mongodb --username qi-botuser --password bot123 --db QualityInsightDB --collection userInfo --file userInfo.json
mongoimport  --host mongodb --username qi-botuser --password bot123 --db QualityInsightDB --collection projectinfo --file projectinfo.json
mongoimport  --host mongodb --username qi-botuser --password bot123 --db QualityInsightDB --collection userMapping --file userMapping.json

