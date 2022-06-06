#!/bin/bash

# Copia pasta transferida
cp -r /tmp/app /home/ubuntu

# Inicia o Docker Swarm
docker swarm init

# Executar stack
docker stack deploy -c /home/ubuntu/app/docker-compose.yml lab-devops-01
