source ~/.config/bash/rc

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

export OBSIDIAN_REST_API_KEY=bf67c1d38cc41c586b6ddc5089e603ea41067212ad43f0d74d221ff272cf3030

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

