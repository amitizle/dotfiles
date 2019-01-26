#!/usr/bin/env bash

source ./utils.sh

TERRAFORM_VERSION=0.11.11

log_info "Downloading terraform version ${TERRAFORM_VERSION}"
curl -sL \
  "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
  -o /tmp/terraform.zip || err_and_exit "cannot download packer"

unzip_no_parent /tmp/terraform.zip "${HOME}/bin"
