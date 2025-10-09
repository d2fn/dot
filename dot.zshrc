
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gallois"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew encode64)
source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/rc

# Customize to your needs...
export PATH=/opt/homebrew/bin:$PATH:~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PG_HOME/bin:$HOME/bin/miniconda2/bin

# don't correct me constantly
unsetopt correct_all
unsetopt correct

export EDITOR=nvim
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export CONFIG_DIR="$HOME/.config"
export TMUX_CONF="$CONFIG_DIR/tmux/tmux.conf"
export PATH="$PATH:$HOME/.local/bin"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(starship init zsh)"
source "$HOME/.sdkman/bin/sdkman-init.sh"

export OBSIDIAN_REST_API_KEY=427d2f7cd573d5d347ebeb820da7d491dbbb55d568bad1d221dac6c6dda5dae1

macchina
