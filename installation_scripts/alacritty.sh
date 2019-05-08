#!/usr/bin/env bash

set -e

source ./utils.sh

ALACRITTY_VERSION="0.3.2"
ALACRITTY_TMP_FILE=/tmp/alacritty.tar.gz
ALACRITTY_TMP_DIR=/tmp/alacritty

cleanup() {
  rm -rf "$ALACRITTY_TMP_FILE" "$ALACRITTY_TMP_DIR"
}

cleanup
mkdir "$ALACRITTY_TMP_DIR"

log_info "Downloading alacritty release from github"
curl -sL \
  "https://github.com/jwilm/alacritty/archive/v${ALACRITTY_VERSION}.tar.gz" \
  -o "$ALACRITTY_TMP_FILE" || err_and_exit "could not download alacritty release form github"

log_info "Extracting alacritty tarball to ${ALACRITTY_TMP_DIR}"
untar_gz_no_parent "$ALACRITTY_TMP_FILE" "$ALACRITTY_TMP_DIR"

log_info "comiling alacritty in ${ALACRITTY_TMP_DIR}"
keepdir=$(pwd)
cd "$ALACRITTY_TMP_DIR" || err_and_exit "cannot cd to ${ALACRITTY_TMP_DIR}"

log_info "building using cargo, it might take some time"
time cargo build --release

log_info "sudo needed for installing the .desktop file"
sudo desktop-file-install ./extra/linux/alacritty.desktop
sudo update-desktop-database
# TODO Missing cp target/release/alacritty /home/amit/bin

log_info "install alacritty's terminfo entry globally"
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# cleanup
cd $keepdir

alacritty --version || err_and_exit "cannot run alacritty --version after installation"
