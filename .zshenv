export CLICOLOR=1
export LESS=' -R '

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
# BROWSER is used in tmux's plugin urlview https://github.com/tmux-plugins/tmux-urlview
export BROWSER=/usr/bin/firefox

# My own compiled things:Golang:brew things
EXTRA_PATHS="$HOME/bin:$HOME/go/bin:$HOME/.mix/escripts:$HOME/.npm-global/bin:$HOME/.apps/bin:$GOPATH/bin:/usr/local/bin:$HOME/.rbenv/bin"
export PATH="$EXTRA_PATHS:$PATH"
export GPG_TTY=$(tty)
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0
