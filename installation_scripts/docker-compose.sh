#!/usr/bin/env bash

source ./utils.sh

COMPOSE_VERSION=1.23.2

log_info "Downloading docker-compose ${COMPOSE_VERSION}"

curl -sL \
  "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
  -o "${HOME}/bin/docker-compose" || err_and_exit "cannot download docker-compose"

docker-compose --version || err_and_exit "while running docker-compose --version"
