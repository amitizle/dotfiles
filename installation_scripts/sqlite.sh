#!/usr/bin/env bash
set -x

# see https://sqlite.org/src/doc/trunk/README.md<Plug>_

source ./utils.sh

SQLITE_TMP_FILE=/tmp/sqlite.tar.gz
SQLITE_TMP_DIR=/tmp/sqlite
SQLITE_TAR_URL="https://www.sqlite.org/src/tarball/sqlite.tar.gz?r=release"

cleanup() {
  rm -rf "$SQLITE_TMP_FILE" "$SQLITE_TMP_DIR"
}

cleanup
mkdir "$SQLITE_TMP_DIR"

log_info "Installing dependencies for sqlite"
log_info "sudo will be needed"

sudo apt-get update
sudo apt-get install -y \
  tcl tcl-dev

log_info "Downloading git tarball from sqlite.org"
curl --progress-bar -L \
  "$SQLITE_TAR_URL" \
  -o "$SQLITE_TMP_FILE"

log_info "Unpacking ${SQLITE_TMP_FILE} to ${SQLITE_TMP_DIR}"
untar_gz_no_parent "$SQLITE_TMP_FILE" "$SQLITE_TMP_DIR"

cd "$SQLITE_TMP_DIR" || err_and_exit "could not cd to ${SQLITE_TMP_DIR}"
log_info "Compiling sqlite"
mkdir bld
cd bld || err_and_exit "could not cd to bld dir while compiling sqlite"
../configure
make
make sqlite3.c
make test
sudo make install

cleanup
