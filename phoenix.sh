#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "${GREEN}- ANTOCKER: PARANDO CONTAINERS...${NC}"
docker-compose stop

echo "${GREEN}- ANTOCKER: DELETANDO CONTAINERS...${NC}"
docker container rm $(docker container ls -aq)

echo "${GREEN}- ANTOCKER: DELETANDO IMAGENS...${NC}"
docker image rm $(docker image ls -aq) --force

echo "${GREEN}- ANTOCKER: RECONSTRUINDO E SUBINDO IMAGENS E CONTAINERS...${NC}"
docker-compose up -d --build

echo "${GREEN}- ANTOCKER: FINALIZADO${NC}"

