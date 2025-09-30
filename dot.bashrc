source ~/.config/bash/rc

eval $(starship init bash)
eval "$(fzf --bash)"

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export TERMINAl=ghostty

# GNOME keyboard shortcut hacks
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
# disable/reduce animtations
gsettings set org.gnome.mutter experimental-features "['no-frame-delay']"
for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Alt>$i']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Alt><Shift>$i']"
done

export OBSIDIAN_REST_API_KEY=f396b7612ced139d37c5e45fe1a0962783c453eb80eb46b73362942244247721

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

