#!/usr/bin/env bash

set -e

source ./utils.sh

NEOVIM_VERSION="0.4.3"
NEOVIM_TMP_FILE=/tmp/neovim.tar.gz
NEOVIM_TMP_DIR=/tmp/neovim

cleanup() {
  rm -rf "$NEOVIM_TMP_FILE" "$NEOVIM_TMP_DIR"
}

cleanup
mkdir "$NEOVIM_TMP_DIR"

log_info "Downloading neovim release ${NEOVIM_VERSION} from github"
curl -sL --progress-bar \
  "https://github.com/neovim/neovim/archive/v${NEOVIM_VERSION}.tar.gz" \
  -o "$NEOVIM_TMP_FILE" || err_and_exit "could not download neovim release form github"

log_info "Extracting neovim tarball to ${NEOVIM_TMP_DIR}"
untar_gz_no_parent "$NEOVIM_TMP_FILE" "$NEOVIM_TMP_DIR"

log_info "comiling neovim in ${NEOVIM_TMP_DIR}"
cd "$NEOVIM_TMP_DIR" || err_and_exit "cannot cd to ${NEOVIM_TMP_DIR}"

make CMAKE_BUILD_TYPE=Release

log_info "sudo needed for running 'sudo make install'"
sudo make install

cleanup

/usr/local/bin/nvim --version || err_and_exit "cannot run neovim --version after installation"
