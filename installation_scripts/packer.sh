#!/usr/bin/env bash

source ./utils.sh

PACKER_VERSION=1.3.3

log_info "Downloading packer version ${PACKER_VERSION}"
curl -sL \
  "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" \
  -o /tmp/packer.zip || err_and_exit "cannot download packer"

# unzip -j -d  /tmp/packer.zip
unzip_no_parent /tmp/packer.zip "${HOME}/bin"
