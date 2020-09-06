#!/usr/bin/env bash

# Install NeoVim

command -v nvim || (echo "NeoVim is not installed" && exit 1)
command -v pip3 || (echo "pip3 is not installed" && exit 1)
command -v git || (echo "git is not installed" && exit 1)
command -v curl || (echo "curl is not installed" && exit 1)

echo "Installing pip3 packages"
pip3 install --user --upgrade neovim jedi psutil setproctitle

echo "Downloading vim-plug"
curl -sfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# echo "Installing powerline fonts"
# git clone https://github.com/powerline/fonts.git ${TMPDIR}/powerline_fonts
# . ${TMPDIR}/powerline_fonts/install.sh
