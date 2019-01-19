#!/usr/bin/env bash

set -e

source ./utils.sh

CURL_VERSION="7.63.0"
CURL_TMP_FILE=/tmp/curl.tar.gz
CURL_TMP_DIR=/tmp/curl

cleanup() {
  rm -rf "$CURL_TMP_FILE" "$CURL_TMP_DIR"
}

cleanup
mkdir "$CURL_TMP_DIR"

log_info "Downloading curl release from github"
curl -sL \
  "https://github.com/curl/curl/releases/download/curl-${CURL_VERSION//\./_}/curl-${CURL_VERSION}.tar.gz" \
  -o "$CURL_TMP_FILE" || err_and_exit "could not download curl release form github"

log_info "Extracting curl tarball to ${CURL_TMP_DIR}"
untar_gz_no_parent "$CURL_TMP_FILE" "$CURL_TMP_DIR"

log_info "comiling curl in ${CURL_TMP_DIR}"
cd "$CURL_TMP_DIR" || err_and_exit "cannot cd to ${CURL_TMP_DIR}"
./configure
make

log_info "sudo needed for running 'sudo make install'"
sudo make install

cleanup

curl --version || err_and_exit "cannot run curl --version after installation"
