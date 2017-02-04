#!/usr/bin/env bash

set -e # Exit on errors

################################################################
# Read arguments

while [ -n "$1" ]; do
  case $1 in
      --binder)
        binder=$2
        shift
        ;;
  esac
shift
done

##################################################################
# Check obligatory arguments
if [ -z "$binder" ]; then
  echo "Usage:"
  echo ""
  echo "bin/build-and-up.sh --binder <kafka | rabbit>"
  echo ""
  exit 1
fi

##################################################################
# Build and run

set -x #Print all commands
./gradlew clean build
bin/docker-compose.sh --binder ${binder} build
bin/docker-compose.sh --binder ${binder} up -d --force-recreate
