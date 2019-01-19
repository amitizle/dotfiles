#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

err_and_exit() {
  printf "${RED}ERROR: %s${NC}\n" "$1"
  exit 1
}

log_info() {
  printf "${GREEN}%s${NC}\n" "$1"
}

log_warn() {
  printf "${YELLOW}%s${NC}\n" "$1"
}

# unzip_no_parent <path_to_zip> <target_dir>
unzip_no_parent() {
  unzip -j -d "$2" "$1"
}

# untar_no_parent <path_to_tar_gz> <target_dir>
untar_gz_no_parent() {
  tar xf "$1" -C "$2" --strip-components=1
}
