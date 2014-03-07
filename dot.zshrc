# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gallois"
#ZSH_THEME="kardan"
#ZSH_THEME="random"
ZSH_THEME="adf"

export VAGRANT_HOME="/Volumes/optibay/vagrant_home"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias json='python -mjson.tool'
alias psx='ps auwx'
alias gitx='open . -a /Applications/GitX.app/'
alias gpr='git pull --rebase origin master'
alias arcd='arc diff --no-amend'
alias vmstat='vm_stat'

alias ss='script/server'
alias sb='script/bootstrap'
alias st='script/test'

alias cctags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'

if [[ `uname` = Darwin ]]; then
  alias sort='gsort';
fi


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew cloudapp encode64 mvn vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/bin:/usr/local/go/bin

export PG_HOME=/Applications/Postgres.app/Contents/Versions/9.3
export PG_CONFIG=$PG_HOME/bin/pg_config

export PATH=$PATH:$PG_HOME/bin

# don't correct me constantly
unsetopt correct_all
unsetopt correct

unalias gp

GOPATH=$HOME/go
export GOPATH

export EDITOR=vim

