#!/usr/bin/env bash

source ./utils.sh

JQ_VERSION=1.6

log_info "Downloading jq ${JQ_VERSION}"
curl -sL \
  "https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64" \
  -o "${HOME}/bin/jq" || err_and_exit "could not download jq"

chmod u+x "${HOME}/bin/jq"

jq --version || err_and_exit "could not run jq --version after installation"
