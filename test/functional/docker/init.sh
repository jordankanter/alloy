#!/bin/bash

echo "Network setup."
docker network create infrastructure > /dev/null

echo "Spawning Traefik."
cd traefik
docker-compose up -d > /dev/null
cd ..

echo "Spawning Ouroboros."
cd ouroboros
docker-compose up -d > /dev/null
cd ..

echo "Spawning Netdata."
cd netdata
docker-compose up -d > /dev/null
cd ..

echo "Spawning Portainer."
cd portainer
docker volume create portainer-data > /dev/null
docker-compose up -d > /dev/null
cd ..