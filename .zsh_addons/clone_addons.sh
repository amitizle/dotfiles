#!/usr/bin/env bash

command -v git || (echo "git is not installed" && exit 1)
git clone https://github.com/olivierverdier/zsh-git-prompt.git $HOME/.zsh_addons/zsh-git-prompt

echo "Make sure to build zsh-git-prompt"
