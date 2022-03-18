#!/bin/bash -e

CYAN='\e[36m'
RED='\e[31m'
GREEN='\e[32m'
END='\e[0m'

GIT_SNAPSHOT=${1:-master}

if [ ! command -v docker &> /dev/null ]; then
    echo -e "${RED}Docker not found.${END}"
    exit 1
fi

echo -e "${CYAN}Build image...${END}"
set -x
docker build --build-arg=${GIT_SNAPSHOT} --tag=lecuay/litecord:${GIT_SNAPSHOT} --file=./Dockerfile .
set +x
echo -e "${GREEN}Done!${END}"
