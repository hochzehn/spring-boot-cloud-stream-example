#!/usr/bin/env bash
./gradlew clean build && \
docker-compose -f docker-compose.yml -f docker-compose.kafka.yml build --no-cache && \
docker-compose -f docker-compose.yml -f docker-compose.kafka.yml up -d --force-recreate
