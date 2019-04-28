#!/usr/bin/env bash

source ./utils.sh

GIT_VERSION=2.21.0
GIT_TMP_FILE=/tmp/git.tar.gz
GIT_TMP_DIR=/tmp/git

cleanup() {
  rm -rf "$GIT_TMP_FILE" "$GIT_TMP_DIR"
}

mkdir "$GIT_TMP_DIR"

log_info "Installing dependencies for git"
log_info "sudo will be needed"

sudo apt-get update
sudo apt-get install -y \
  dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev \
  install-info asciidoc xmlto docbook2x

log_info "Downloading git tarball from Github releases"
curl -sL \
  "https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz" \
  -o "$GIT_TMP_FILE"

log_info "Unpacking ${GIT_TMP_FILE} to ${GIT_TMP_DIR}"
untar_gz_no_parent "$GIT_TMP_FILE" "$GIT_TMP_DIR"

cd "$GIT_TMP_DIR" || err_and_exit "could not cd to ${GIT_TMP_DIR}"
log_info "Compiling git"
make configure
./configure --prefix=/usr
make all doc info
sudo make install install-doc install-html install-info

cleanup

git --version || err_and_exit "could not run git --version after installation"
