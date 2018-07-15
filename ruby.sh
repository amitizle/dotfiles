#!/usr/bin/env bash

command -v brew || (echo "Homebrew is not installed" && exit 1)
brew update && brew install rbenv
rbenv init
brew install ruby-build
mkdir -p "$(rbenv root)"/plugins

echo "Cloning ruby-build"
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build # build ruby versions

echo "Cloning rbenv-default-gems"
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems # default gems for each ruby version

DEFAULT_GEMS_FILE="$(rbenv root)/default-gems"
echo "Populating $DEFAULT_GEMS_FILE with default gems"
cat > $DEFAULT_GEMS_FILE <<- EOM
wirb
awesome_print
interactive_editor
EOM
