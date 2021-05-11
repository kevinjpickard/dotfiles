export ZSH="$HOME/.oh-my-zsh"
# TMux ZSH Plugin Behavior
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=false
plugins=(tmux)
source $ZSH/oh-my-zsh.sh
DISABLE_UPDATE_PROMPT="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# OSX env
if [[ $OSTYPE == darwin* ]]; then
  #echo 'Setting up macOS env...'
  source ~/.myenvvars

  # Homebrew installs + coreutils
  export PATH="/usr/local/Cellar:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

  # Agent version check
  alias vcheck='python ~/scripts/vcheck.py'

  export JUMPCLOUD_WORKSPACE='/Users/kevinpickard/go/src/github.com/TheJumpCloud'
  export PGDATA='/var/lib/postgresql/data/pgdata'

  # SSH AUTH SOCKET for docker shtuff (OSX Only)
  #export SSH_AUTH_SOCK=/tmp/ssh-4dvkFlwhJY/agent.3217
  #PGDATA=/var/lib/postgresql/data/pgdata
  #alias vcheck="python ~/scripts/vcheck.py"
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

  ## pyenv install fix ##
  # For compilers to find zlib you may need to set:
  export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
  export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

  # For pkg-config to find zlib you may need to set:
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
  ## pyenv install fix ##

  # Use GNU tar, not BSD
  PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

  # Docker SSH Agent Forwarding
  export DOCKER_SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock
else
fi

export EDITOR='nvim'

# Completions
## ZSH
fpath=(/usr/local/share/zsh-completions $fpath)

# PowerLine
#. /usr/local/lib/python3.6/*-packages/powerline/bindings/zsh/powerline.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
. "/usr/local/opt/nvm/nvm.sh"
export PATH="$PATH:$(nvm which current)"

# added by travis gem
[ -f /Users/kevin/.travis/travis.sh ] && source /Users/kevin/.travis/travis.sh

# Ruby Setup
export RBENV_VERSION="2.6.5"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/versions/$RBENV_VERSION/bin:$PATH"
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
eval "$(rbenv init -)"

# added by Miniconda3 4.3.21 installer
export PATH="/Users/kevin/miniconda3/bin:$PATH"

# For all those times you just fuck up
eval $(thefuck --alias)

# Use NeoVim if it is installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Set config home
export XDG_CONFIG_HOME=~/.config

# Miniconda
#export PYTHONPATH=/usr/local/miniconda3/bin:$PYTHONPATH

export PATH="/usr/local/opt/mongodb@3.0/bin:$PATH"

# Antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

#alias ll='ls --color=auto -lhaH'
alias ll='ls -lhaH'
alias dots='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias tre='tree -CDFfpugha'
# Alias to update all git repos in a directory
alias gitsyncall='find . -maxdepth 1 -type d -exec sh -c "(cd {} && pwd && git sync)" ";"'

alias sync-system='ANSIBLE_LIBRARY=~/sysconfig/ansible/library/aur ansible-playbook --connection=local  ~/sysconfig/ansible/sync.yml --extra-vars "username=$USER"'

# Ignore Vagrant warning about winrm, kitchen still wants it installed. I'll submit an issue at some point
export VAGRANT_IGNORE_WINRM_PLUGIN=true

# added by travis gem
[ -f /home/kevin/.travis/travis.sh ] && source /home/kevin/.travis/travis.sh

# Pywal colorscheme
#(cat $HOME/.cache/wal/sequences &)
#source ~/.cache/wal/colors-tty.sh

#export color0_alpha="#08${color0/'#'}"

# Pretty-Print Path
alias path="echo $PATH | tr -s ':' '\n'"
export GALLIUM_HUD=fps

# pyenv init
export PATH="/home/kevin/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Trying to add a different background color to prompt lines to make them pop-out (useful for commands with a lot of output)
#PROMPT='%{$bg[grey]%} '$PROMPT

# Go Stuff
export GOPATH=~/go
export GOBIN="$GOPATH/bin"
export PATH="${PATH}:$GOBIN"
export PATH=$PATH:/usr/local/go/bin
export GOPRIVATE=github.com/TheJumpCloud
export GOFLAGS=-mod=vendor

# Docker/Docker-Compose
alias dc='docker-compose'
alias dcci='docker-compose --file docker-compose.ci.yml'
function dcuf() {
  dc up -d $1 && dc logs -f $1
}

#export SSH_AUTH_SOCK="/private$SSH_AUTH_SOCK" # Fix this. For some reason its never set correctly and breaks
alias fixauthsock='export SSH_AUTH_SOCK="/private$SSH_AUTH_SOCK"' # For some reason this keeps getting set wrong, breaks docker

# added by travis gem
[ -f /Users/kevinpickard/.travis/travis.sh ] && source /Users/kevinpickard/.travis/travis.sh

# AutoENV Configs
CLICOLOR=1

# Remove background colos for ls
eval "$(dircolors -p | \
      sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
          dircolors /dev/stdin)"

# Poetry config
export PATH="$PATH:$HOME/.poetry/bin"

