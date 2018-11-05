export ZSH="$HOME/.oh-my-zsh"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOEXE="$GOPATH/exe"

# OSX env
if [[ $OSTYPE == darwin* ]]; then
  #echo 'Setting up macOS env...'
  source ~/.myenvvars

  # Homebrew installs + coreutils
  export PATH="/usr/local/Cellar:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

  # Agent version check
  alias vcheck='python ~/scripts/vcheck.py'

  export JUMPCLOUD_WORKSPACE='/Users/kevin/go/src/github.com/TheJumpCloud'
  export PGDATA='/var/lib/postgresql/data/pgdata'

  # SSH AUTH SOCKET for docker shtuff (OSX Only)
  #export SSH_AUTH_SOCK=/tmp/ssh-4dvkFlwhJY/agent.3217
  #PGDATA=/var/lib/postgresql/data/pgdata
  #alias vcheck="python ~/scripts/vcheck.py"
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

  source $(brew --prefix)/share/antigen/antigen.zsh
else
  source /usr/share/zsh/share/antigen.zsh
fi

export EDITOR='nvim'

# Completions
## ZSH
fpath=(/usr/local/share/zsh-completions $fpath)

# PowerLine
#. /usr/local/lib/python3.6/*-packages/powerline/bindings/zsh/powerline.zsh

nvm() { # Lazy-Loading NVM to speed up shell start
  unset -f nvm
  export NVM_DIR="$HOME/.nvm"
  #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  . "/usr/local/opt/nvm/nvm.sh"
  nvm "$@"
}

# added by travis gem
[ -f /Users/kevin/.travis/travis.sh ] && source /Users/kevin/.travis/travis.sh

export RBENV_VERSION="2.5.1"
export PATH="$HOME/.rbenv/bin:$PATH"
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

# Go paths
export PATH="$PATH:$GOBIN"

# Antigen pkg manager
antigen use oh-my-zsh
#antigen theme bureau
antigen theme nanotech
antigen bundle LockonS/host-switch
antigen bundle desyncr/auto-ls
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle caarlos0/zsh-git-sync
antigen bundle adrieankhisbe/diractions

antigen apply

alias ll='ls --color=auto -lhaH'
alias dots='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias tre='tree -CDFfpugha'
# Alias to update all git repos in a directory
alias gitsyncall='find . -maxdepth 1 -type d -exec sh -c "(cd {} && pwd && git sync)" ";"'

alias sync-system='ANSIBLE_LIBRARY=~/sysconfig/library/aur ansible-playbook --connection=local  ~/sysconfig/sync.yml'

# Ignore Vagrant warning about winrm, kitchen still wants it installed. I'll submit an issue at some point
export VAGRANT_IGNORE_WINRM_PLUGIN=true

