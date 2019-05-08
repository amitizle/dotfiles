#!/usr/bin/env bash

set -e

source ./utils.sh

ZOOM_URL=https://zoom.us/client/latest/zoom_amd64.deb
ZOOM_DEB_TARGET=/tmp/zoom_setup.deb

log_info "Downloading ${ZOOM_URL}"
RUN curl -L --progress-bar "$ZOOM_URL" -o "$ZOOM_DEB_TARGET"

log_info "Installing deb file, sudo will be needed"
sudo dpkg -i "$ZOOM_DEB_TARGET"
apt-get -f install

rm -f "$ZOOM_DEB_TARGET"

log_info "Finished installing zoom.us"
