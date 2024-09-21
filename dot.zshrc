alias lsa='ls -alh'
alias vi='vim'

export CONFIG_DIR="$HOME/.config"

export TMUX_CONF="$CONFIG_DIR/tmux/tmux.conf"

export PATH="$PATH:$HOME/.local/bin"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(starship init zsh)"

macchina



