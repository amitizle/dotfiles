#!/usr/bin/env bash

###########
# Spotify #
###########

spotify() {
  osascript -e "tell application \"Spotify\" to $*"
}

alias spotify-next="spotify \"next track\""
alias spotify-prev="spotify \"previous track\""
alias spotify-play="spotify \"play\""
alias spotify-pause="spotify \"pause\""

###############
# Information #
###############
alias batt='pmset -g batt'

