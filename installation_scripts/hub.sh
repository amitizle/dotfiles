#!/usr/bin/env bash

source ./utils.sh

HUB_VERSION="2.11.1"

HUB_SOURCE="https://github.com/github/hub/releases/download/v${HUB_VERSION}/hub-linux-amd64-${HUB_VERSION}.tgz"
HUB_TMP_FILE=/tmp/hub.tgz
HUB_TMP_DIR=/tmp/hub

cleanup() {
  rm -rf "$HUB_TMP_DIR" "$HUB_TMP_FILE"
}

cleanup
mkdir "$HUB_TMP_DIR"

log_info "Downloading $HUB_SOURCE"
curl -sL "$HUB_SOURCE" -o "$HUB_TMP_FILE"

log_info "Extracting hub ${HUB_VERSION} to ${HUB_TMP_DIR}"
tar xf "$HUB_TMP_FILE" -C "$HUB_TMP_DIR" --strip-components=1
cd "$HUB_TMP_DIR" || err_and_exit "Cannot cd to $HUB_TMP_DIR"

log_info "sudo needed for installing hub to prefix /usr/local"
sudo prefix=/usr/local ./install

cleanup
