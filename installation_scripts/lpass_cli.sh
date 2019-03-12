#!/usr/bin/env bash

set -e

source ./utils.sh

LPASS_VERSION=1.3.1
LPASS_TMP_FILE=/tmp/lpass.tar.gz
LPASS_TMP_DIR=/tmp/lpass

cleanup() {
  rm -rf "$LPASS_TMP_FILE" "$LPASS_TMP_DIR"
}

cleanup
mkdir "$LPASS_TMP_DIR"

log_info "Installing prerequisites"
sudo apt-get --no-install-recommends -y install \
  libxml2 \
  libxml2-dev  \
  pkg-config

log_info "Downloading lpass release from github"
curl -sL --progress-bar \
  "https://github.com/lastpass/lastpass-cli/releases/download/v${LPASS_VERSION}/lastpass-cli-${LPASS_VERSION}.tar.gz" \
  -o "$LPASS_TMP_FILE" || err_and_exit "could not download lpass release form github"

log_info "Extracting lpass tarball to ${LPASS_TMP_DIR}"
untar_gz_no_parent "$LPASS_TMP_FILE" "$LPASS_TMP_DIR"

log_info "comiling lpass in ${LPASS_TMP_DIR}"
cd "$LPASS_TMP_DIR" || err_and_exit "cannot cd to ${LPASS_TMP_DIR}"
make

log_info "sudo needed for running 'sudo make install'"
sudo make install

cleanup

lpass --help || err_and_exit "cannot run lpass --help after installation"
