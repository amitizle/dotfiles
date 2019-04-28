#!/usr/bin/env bash

set -e

######################################
# https://joeyh.name/code/moreutils/ #
######################################

source ./utils.sh

MORE_UTILS_REPO="git://git.joeyh.name/moreutils"
MORE_UTILS_TAG="0.63"
MORE_UTILS_TMPDIR="$(mktemp -d)/moreutils"

log_info "cloning more utils to ${MORE_UTILS_TMPDIR}"
git clone "$MORE_UTILS_REPO" "$MORE_UTILS_TMPDIR" --branch "$MORE_UTILS_TAG"

cd "$MORE_UTILS_TMPDIR"

log_info "compiling more utils"
make

log_info "installing more utils - sudo will be needed"
sudo make install PREFIX=/usr

/usr/bin/errno 1 || err_and_exit "cannot run errno after installation (a part of more utils)"
