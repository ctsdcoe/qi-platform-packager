#!/bin/bash
# Script to start the job server
# Extra arguments will be spark-submit options, for example
#  ./server_start.sh --jars cassandra-spark-connector.jar
#
# Environment vars (note settings.sh overrides):
#   JOBSERVER_MEMORY - defaults to 1G, the amount of memory (eg 512m, 2G) to give to job server
#   JOBSERVER_CONFIG - alternate configuration file to use
#   JOBSERVER_FG    - launches job server in foreground; defaults to forking in background
set -e

get_abs_script_path() {
  pushd . >/dev/null
  cd "$(dirname "$0")"
  appdir=$(pwd)
  popd  >/dev/null
}

get_abs_script_path

set -a
. $appdir/setenv.sh
set +a

GC_OPTS_SERVER="$GC_OPTS_BASE -Xloggc:$appdir/$GC_OUT_FILE_NAME"

MAIN="spark.jobserver.JobServer"

PIDFILE=$appdir/spark-jobserver.pid
if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE"); then
   echo 'Job server is already running'
   exit 1
fi

cmd='$SPARK_HOME/bin/spark-submit --class $MAIN --driver-memory $JOBSERVER_MEMORY --jars /qispark/lib/mongo-spark-connector_2.11-2.2.0.jar,/qispark/lib/mongo-java-driver-3.4.2.jar,/qispark/lib/spark-csv_2.11-0.1.0_v3.jar,/qispark/lib/jettison-1.1.jar --driver-class-path /qispark/lib/mongo-spark-connector_2.11-2.2.0.jar:/qispark/lib/mongo-java-driver-3.4.2.jar:/qispark/lib/spark-csv_2.11-0.1.0_v3.jar:/qispark/lib/jettison-1.1.jar --conf spark.executor.extraClassPath=/qispark/lib/mongo-spark-connector_2.11-2.2.0.jar:/qispark/lib/mongo-java-driver-3.4.2.jar:/qispark/lib/bson-3.2.2.jar:lib\spark-csv_2.11-0.1.0_v3.jar:/qispark/lib/jettison-1.1.jar --conf spark.driver.maxResultSize=4G --conf "spark.executor.extraJavaOptions=$LOGGING_OPTS" --driver-java-options "$GC_OPTS_SERVER $JAVA_OPTS_SERVER $LOGGING_OPTS $CONFIG_OVERRIDES" $@ $appdir/spark-job-server.jar $conffile'
if [ -z "$JOBSERVER_FG" ]; then
  eval $cmd > $LOG_DIR/server_start.log 2>&1 < /dev/null &
  echo $! > $PIDFILE
else
  eval $cmd
fi

#path of Spark Job Server Context creation script
$appdir/setup_qi_spark.sh
echo "spark context and jars uploaded"

