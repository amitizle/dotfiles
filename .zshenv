
export CLICOLOR=1
export LESS=' -R '

# Golang
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec

# My own compiled things:Golang:brew things
EXTRA_PATHS="$HOME/.mix/escripts:$HOME/.npm-global/bin:$HOME/.apps/bin:$GOPATH/bin:/usr/local/bin"
export PATH="$EXTRA_PATHS:$PATH"
