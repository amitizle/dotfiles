CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE=true

autoload -Uz compinit promptinit colors select-word-style
compinit -C
zmodload -i zsh/complist
zmodload -i zsh/mapfile
promptinit
colors
# Alt + backspace for deleting up to a slash (for example)
select-word-style bash
fpath=(/usr/local/share/zsh-completions $fpath)

###########
# Aliases #
###########
alias vlc="open -na /Applications/VLC.app/Contents/MacOS/VLC"
alias shrug='echo -n "¯\_(ツ)_/¯" | pbcopy'
alias sqlite='sqlite3 -column -header'
alias vim='vim -p'
alias vi='vim -p'
alias nvim='nvim -p'
alias diff='colordiff'
alias screen='TERM=xterm-256color screen'
alias bc='bc -l'
alias c='xargs echo -n | pbcopy'
alias l='ls -lthFAr'
alias mkdir='mkdir -pv'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color'
alias info='info --vi-keys'
alias sl='ls'
alias jcurl='curl -H "Accept: application/json" -H "Content-Type: application/json"'
alias travis='/usr/local/bin/travis'
alias vim='nvim'

####################
# Extra completion #
####################
for f in $(find $HOME/.completion/ -type f); do
  source $f
done

##############
# Docker/K8s #
##############
alias docker-cleanup-all='docker stop $(docker ps -q); docker rm -f $(docker ps -qa); docker rmi -f $(docker images -qa)'
alias docker-cleanup-containers='docker stop $(docker ps -q); docker rm -f $(docker ps -qa)'
alias docker-ps='docker ps -a --format "{{.Names}} ({{.Image}}): {{.Status}} (Running for {{.RunningFor}}, Created At: {{.CreatedAt}})"'
alias docker-run-command='docker inspect  --format "{{.Name}} {{.Config.Cmd}}" $(docker ps -a -q)'
alias docker-stop-all='docker stop $(docker ps -q)'
alias docker-ips='docker inspect -f "{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $(docker ps -aq)'

############
# Minikube #
############

function reset_minikube(){
  minikube config set cpus 4
  minikube config set memory 4096
  minikube config view
  minikube delete || true
  minikube start --vm-driver virtualbox
}

###########
# Vagrant #
###########
function vagrant-destroy-all(){
  CURR_PATH=`pwd`
  vagrant global-status --prune # Refresh vagrant global cache on ~/.vagrant.d
  for machine_path in $(vagrant global-status | grep virtualbox | awk '{ print $5 }'); do
    echo "destroying machine in $machine_path"
    cd $machine_path
    vagrant destroy -f
  done
  cd $CURR_PATH
}

function vagrant-halt-all(){
  CURR_PATH=`pwd`
  vagrant global-status --prune # Refresh vagrant global cache on ~/.vagrant.d
  for machine_path in $(vagrant global-status | grep virtualbox | awk '{ print $5 }'); do
    echo "halting machine in $machine_path"
    cd $machine_path
    vagrant halt -f
  done
  cd $CURR_PATH
}

#==================
#= *nix functions =
#==================

function decode_base64(){
  echo "$1" | base64 --decode ;
}

function ff(){ find . -type f -iname '*'"$*"'*' -ls ; }

function create_file(){
  dd if=/dev/zero of="$1"  bs=1M  count="$2" ;
}

function ssh_connections_linux(){
  sudo netstat -atp | grep 'ESTABLISHED.*ssh '
}

function ssh_connections_osx(){
  lsof -i tcp | grep "^ssh"
}


function times(){
  for i in $(seq $1); do ${*:2}; done;
}

function beauty_title(){
  ruby -e 'args = ARGV.join(" "); sep = ("#" * (args.size + 4)); puts sep + "
# " + args + " #
" + sep' ${*:1}
}

function random_string(){
  date +%s | shasum -a 256 | base64 | head -c 32 ; echo
}

#######
# SSL #
#######
function verify_ssl(){
  local res=$(curl --insecure -v "$1" 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }')
  ([ -z "${res}" ] && echo "Usage: verify_ssl https://example.com (scheme must be provided)") || echo $res
}

# Note that "redundant" -servername parameter is necessary to make openssl do a request with SNI support
function verify_ssl_openssl(){
  echo | openssl s_client -showcerts  -servername "${2}" -connect "${1}" 2>/dev/null | openssl x509 -inform pem -noout -text
}

#######
# Git #
#######
functions private_git(){
  git config user.email "amit.goldberg@gmail.com";
  git config user.name "Amit Goldberg"
}

function pull_all_git(){
  for dir in $(find . -type d -depth 1); do
    echo "running git pull in $dir"
    cd $dir
    git pull
    cd ..
  done
}

function git_pr_merged(){
  local _curr_branch=$(git rev-parse --abbrev-ref HEAD)
  git checkout master
  git pull
  echo "Deleting branch $_curr_branch"
  git branch -D $_curr_branch
}

function hub_compare_last_two(){
  local HEAD_REV=$(git rev-parse --verify HEAD)
  local PREV_REV=$(git rev-parse --verify HEAD^)
  hub compare ${PREV_REV}..${HEAD_REV}
}

function gi() {
  if [[ $# -eq 0 ]]
  then
    echo "Usage: gi go,java,..."
    exit 1
  fi
  curl -L -s "https://www.gitignore.io/api/$@"
}

##############
# Media/Misc #
##############
function pdfjoin(){
  OUTPUT_FILENAME="$(random_string).pdf";
  /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py -o $OUTPUT_FILENAME ${*:1};
  echo "Merged to $OUTPUT_FILENAME"
}

function wttr()
{
  curl -H "Accept-Language: en" wttr.in/"${1:-Dublin}"
}

function is_yaml(){
  ruby -r'yaml' -r'json' -e "begin JSON.pretty_generate(YAML.load_file('$1')); puts 'YES'; rescue Exception => e; puts 'NO'; end"
}

function yaml_to_json(){
  ruby -r'yaml' -r'json' -e "puts JSON.pretty_generate(YAML.load_file('$1'))"
}

function is_json(){
  ruby -r'json' -e "begin JSON.parse(File.read('$1')); puts 'YES'; rescue Exception => e; puts 'NO'; end"
}

##############
# ZSH Config #
##############

# Addons
export GIT_PROMPT_EXECUTABLE="haskell"
source $HOME/.env_secrets
source $HOME/.zsh_addons/zsh-git-prompt/zshrc.sh
source $HOME/.zsh_addons/zsh_prompt
for s in $(find $HOME/.zsh_sources -type f)
do
  source $s
done

# ZSH key binding
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Stop completing things like /u/b to /usr/bin:
zstyle ':completion:*' path-completion false
# Stop the damn ls rep<Tab> --> ls Pictures completion
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' matcher-list ''
# General zstyle things
zstyle ':completion::complete:*' use-cache on # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh_addons/cache
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#################
# Erlang/Elixir #
#################
function erl_version(){
  export ERLANG_VERSION="$1"
  . $HOME/.kerl/installs/$ERLANG_VERSION/activate
}

function iex_version(){
  export ELIXIR_VERSION="$1"
  . $HOME/.kiex/elixirs/elixir-"$ELIXIR_VERSION".env
}

erl_version "20.2"
iex_version "1.5.1"
alias erl_observer='erl -sname observer -run observer -detached'

########
# Ruby #
########
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias be='bundle exec'
alias bek='bundle exec kitchen'
alias ber='bundle exec rake'

#######
# Lua #
#######
eval $(luarocks path --bin)

##############
# Start tmux #
##############
[[ -z "$TMUX" ]] && tmux

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
