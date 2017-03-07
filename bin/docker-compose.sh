#!/usr/bin/env bash

set -e # Exit on errors

################################################################
# Read arguments

case $1 in
  --binder)
    binder=$2
    shift
    ;;
esac
shift

command=$@

##################################################################
# Check obligatory arguments
if [ -z "$binder" ] || [ -z "$command" ]; then
  echo "Usage:"
  echo ""
  echo "bin/docker-compose.sh --binder <kafka | rabbit> command"
  echo ""
  exit 1
fi

##################################################################
# Set correct docker-compose

 case "$binder" in
      kafka)
        DOCKER_COMPOSE_FILES="--file docker-compose.yml --file docker-compose.kafka.yml"
        ;;
      kafka-local)
        DOCKER_COMPOSE_FILES="--file docker-compose.yml --file docker-compose.kafka.yml --file docker-compose.kafka-local.yml"
        ;;
      rabbit)
        DOCKER_COMPOSE_FILES="--file docker-compose.yml --file docker-compose.rabbit.yml"
  esac

##################################################################
# Build and run

set -x #Print all commands
docker-compose ${DOCKER_COMPOSE_FILES} ${command}
