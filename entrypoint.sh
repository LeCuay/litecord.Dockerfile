#!/bin/bash -e

CYAN='\e[36m'
RED='\e[31m'
GREEN='\e[32m'
END='\e[0m'

cd /litecord/

echo -e "${CYAN}Migrating database...${END}"
poetry run ./manage.py migrate

echo -e "${CYAN}Initializing litecord...${END}"
poetry run hypercorn run:app -b 0.0.0.0:5000
