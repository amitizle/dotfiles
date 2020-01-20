export CLICOLOR=1
export LESS=' -R '

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
# BROWSER is used in tmux's plugin urlview https://github.com/tmux-plugins/tmux-urlview
# It's also used in with `hub`
export BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox-bin
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

EXTRA_PATHS="/usr/local/bin:/usr/local/sbin:/usr/local/opt/curl/bin:$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/go/bin:$HOME/.npm-global/bin:$GOPATH/bin:$HOME/.rbenv/bin"
export PATH="$EXTRA_PATHS:$PATH"
export GPG_TTY=$(tty)
# export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

export NVM_DIR="$HOME/.nvm"
