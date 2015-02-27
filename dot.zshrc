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
ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias json='python -mjson.tool'
alias psx='ps auwx'
alias gitx='open . -a /Applications/GitX.app/'
alias gpr='git pull --rebase origin master'
alias arcd='arc diff --no-amend'
alias vmstat='vm_stat'
alias mvndeploy='mvn clean javadoc:jar source:jar deploy'

alias ss='script/server'
alias sb='script/bootstrap'
alias st='script/test'

alias gsh='ssh -A -t remote.github.net ssh -A -t $1'

alias cctags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'

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
source /opt/boxen/env.sh

export PG_HOME=/Applications/Postgres.app/Contents/Versions/9.3
export PG_CONFIG=$PG_HOME/bin/pg_config

# Customize to your needs...
export PATH=$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PG_HOME/bin

# don't correct me constantly
unsetopt correct_all
unsetopt correct

export EDITOR=vim

eval "$(rbenv init -)"

export BOXEN_SOCKET_DIR=/data/socket
export GH_SOCKET_DIR=$BOXEN_SOCKET_DIR
export BOXEN_POSTGRESQL_HOST=localhost
export BOXEN_POSTGRESQL_PORT=5432

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH


