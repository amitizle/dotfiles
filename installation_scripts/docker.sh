#!/usr/bin/env bash

source ./utils.sh

COMPLETION_DIR="$HOME/.completion"

log_info "Getting docker completion"
curl -sL \
  "https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/zsh/_docker" \
  -o "${COMPLETION_DIR}/_docker"
