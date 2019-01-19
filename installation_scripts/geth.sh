#!/usr/bin/env bash

set -e

source ./utils.sh

GETH_VERSION=1.8.21-9dc5d1a9
GETH_TMP_FILE=/tmp/geth_and_tools.tgz
GETH_TMP_DIR=/tmp/geth_and_tools

cleanup() {
  rm -rf "$GETH_TMP_DIR" "$GETH_TMP_FILE"
}

cleanup
mkdir "$GETH_TMP_DIR"

log_info "Downloading geth & tools ${GETH_VERSION}"
curl -sL \
  "https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-${GETH_VERSION}.tar.gz" \
  -o "$GETH_TMP_FILE" || err_and_exit "while downloading geth and tools"

log_info "Extracting geth tools ${GETH_VERSION} to ${GETH_TMP_DIR}"
untar_gz_no_parent "$GETH_TMP_FILE" "${HOME}/bin"

cleanup
rm -f "${HOME}/bin/COPYING" # Thanks geth for making it easy to extract them binaries :/
geth version || err_and_exit "Could not run 'geth version' after installation"
