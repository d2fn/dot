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
alias pclean='sudo ~luna/bin/cleanPreviousInstall'
alias pmount='~luna/bin/mountebuild'
alias curl='curl --silent'

alias s3d2fn='s3cmd -c ~/.s3d2fn'

alias g='./gradlew'

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
plugins=(git brew encode64 mvn)
source $ZSH/oh-my-zsh.sh

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export HADOOP_HOME=$HOME/bin/hadoop
export PG_HOME=/Applications/Postgres.app/Contents/Versions/9.4

# Customize to your needs...
export PATH=$PATH:~/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PG_HOME/bin:$HOME/bin/miniconda2/bin

# don't correct me constantly
unsetopt correct_all
unsetopt correct

export EDITOR=vim

export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH


