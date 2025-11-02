#!/bin/bash

source ~/.config/bash/rc

eval $(starship init bash)
eval "$(fzf --bash)"

export GOPATH=~/go
export PATH=$HOME/bin:$PATH:$GOPATH/bin
export TERMINAl=ghostty
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export XDG_CONFIG_HOME=$HOME/.config

export OBSIDIAN_REST_API_KEY=4709ff07a26d7ffa8c8c333ac7eeec969b89e4a3db258783767f29d6303a8126

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

