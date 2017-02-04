# spring-boot-cloud-stream-example
Simple hello world setup of Spring Boot with Kafka / RabbitMQ running in docker-compose

## Pre-Requisites
* docker 
* docker-compose 
* Java
* OSX (macOS) / Linux to run the commands

## Getting Started
* Checkout repository
* Execute
  
  * With rabbit:
     
     `bin/build-and-up.sh --binder rabbit`
  * With kafka:
     
     `bin/build-and-up.sh --binder kafka` 
  
* Show logs of consumer

   `docker-compose logs -f --tail 100 consumer`

## Useful commands
* Stop all container

  `bin/docker-compose.sh --binder <rabbit|kafka> stop`
  
## Scripts
The scripts are simple wrapper for convenience so that there is no need to specify docker-compose files manually.
These commands all have the same result:
* `bin/build-and-up.sh --binder kafka`
* `bin/docker-compose.sh --binder kafka up -d --force-recreate` 
* `docker-compose -f docker-compose.yml -f docker-compose.kafka.yml up -d --force-recreate` 

