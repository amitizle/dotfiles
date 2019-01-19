#!/usr/bin/env bash

# TODO this is not yet implemented REALLY

curl -L "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip" -o /tmp/ngrok.zip
unzip -j -d "$HOME"/.apps/bin /tmp/ngrok.zip
