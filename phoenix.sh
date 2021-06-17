#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "${GREEN}- ANTOCKER: STOPPING CONTAINERS...${NC}"
docker-compose stop

echo "${GREEN}- ANTOCKER: DELETING CONTAINERS...${NC}"
docker container rm $(docker container ls -aq)

echo "${GREEN}- ANTOCKER: DELETING IMAGES...${NC}"
docker image rm $(docker image ls -aq) --force

echo "${GREEN}- ANTOCKER: REBUILDING...${NC}"
docker-compose up -d --build

echo "${GREEN}- ANTOCKER: DONE${NC}"