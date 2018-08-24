#!/usr/bin/env bash
set -e

##### Constants --Testing section
QI_MONGODB_IMAGE="alexpunct/mongo"
QI_MONGO_SEEDDATA_IMAGE='ec2-34-212-9-250.us-west-2.compute.amazonaws.com:443/mongo-seed'
QI_SPARKJOB_SERVER_IMAGE='ec2-34-212-9-250.us-west-2.compute.amazonaws.com:443/qi-sparkjob-server'
QI_SERVER_IMAGE='ec2-34-212-9-250.us-west-2.compute.amazonaws.com:443/qi-server'


##### Functions

banner()
{
  echo '========================================================================================================'
  echo '************************************QI docker compose script v0.1***************************************'
  echo '========================================================================================================'

}

init()
{
  tag=$1
  if [ -z $tag ]; then
    echo "no tag info being passed latest tag being used for running the containers"
    #TODO need to be changed to startdard format of mongo
    export QI_MONGODB=${QI_MONGODB_IMAGE}:3.4
    export QI_MONGO_SEEDDATA=${QI_MONGO_SEEDDATA_IMAGE}:latest
    export QI_SPARKJOB_SERVER=${QI_SPARKJOB_SERVER_IMAGE}:4.0.3
    export QI_SERVER=${QI_SERVER_IMAGE}:4.0.3
  else
    echo "container tag $tag is being used for running qi containers"
    export QI_MONGODB=${QI_MONGODB_IMAGE}:${tag}
    export QI_MONGO_SEEDDATA=${QI_MONGO_SEEDDATA_IMAGE}:${tag}
    export QI_SPARKJOB_SERVER=${QI_SPARKJOB_SERVER_IMAGE}:${tag}
    export QI_SPARK_EXECUTE=${QI_SPARK_EXECUTE_IMAGE}:${tag}
    export QI_SERVER=${QI_SERVER_IMAGE}:${tag}

  fi
}

run_qi_containers()
{
   #Start the docker compose
   echo "running docker compose"
   docker-compose up -d

}

##### Main
banner
init $1
run_qi_containers


