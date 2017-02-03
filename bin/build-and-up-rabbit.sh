#!/usr/bin/env bash
gradle clean build && \
docker-compose -f docker-compose.yml -f docker-compose.rabbit.yml build --no-cache && \
docker-compose -f docker-compose.yml -f docker-compose.rabbit.yml up -d --force-recreate
