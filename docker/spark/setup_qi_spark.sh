#!/bin/bash
sleep 10s
curl -k --basic --user "$SPARK_UNAME:$SPARK_PWD" -i -d "" "http://$SPARK_HOST:$SPARK_PORT/contexts/sql-context-1?num-cpu-cores=2&memory-per-node=4G&context-factory=spark.jobserver.context.SessionContextFactory"
sleep 10s
curl -k --basic --user "$SPARK_UNAME:$SPARK_PWD" --data-binary @/qispark/qi_bots_v1.jar http://$SPARK_HOST:$SPARK_PORT/jars/test
